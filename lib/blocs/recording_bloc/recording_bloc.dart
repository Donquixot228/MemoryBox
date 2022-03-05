import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:external_path/external_path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:memorybox2/cubits/audio_builder_cubit/audio_file_builder_cubit.dart';
import 'package:memorybox2/repositories/database_repository/database_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:path/path.dart';

part 'recording_event.dart';

part 'recording_state.dart';

class RecordingBloc extends Bloc<RecordingEvent, RecordingState> {
  File? file;
  Record? audioRecorder;
  Timer? timerAmplitude;
  List listAmplitude = [];
  Timer? timer;
  final DataBaseRepository _dataBaseRepository;
  final AudioFileBuilder _audioFileBuilder = AudioFileBuilder();

  RecordingBloc({required DataBaseRepository dataBaseRepository})
      : _dataBaseRepository = dataBaseRepository,
        super(RecordingState()) {
    on<OpenSession>((event, emit) async {
      final status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw Exception('Microphone is not enable');
      }
      audioRecorder = Record();
      emit(state.copyWith(isRecorderInitialised: true));
      log('recorder initialize ${state.isRecorderInitialised}');
      final String t = await ExternalPath.getExternalStoragePublicDirectory(
          ExternalPath.DIRECTORY_DOWNLOADS);
      emit(state.copyWith(storagePath: t));
    });
    on<StartRecorder>((event, emit) async {
      if (!state.isRecorderInitialised) return;
      Directory directory = await getApplicationDocumentsDirectory();
      String filePath = directory.path + '/' + '${await _generateFileName()}';
      _startTimer();
      audioRecorder?.start(path: filePath);
      _getAmplituder();
      emit(
        state.copyWith(
          status: RecordingStatus.started,
          listAmplitude: [],
          fileCashePath: filePath,
        ),
      );
      log('recording to ${state.fileCashePath}');
      log('storage path is : ${state.storagePath}');
    });
    on<StopRecorder>((event, emit) async {
      if (!state.isRecorderInitialised) return;
      await audioRecorder?.stop();
      timerAmplitude?.cancel();
      timer?.cancel();
      emit(state.copyWith(duration: Duration(seconds: 0)));
      String fileName = await _generateFileName();
      emit(state.copyWith(fileName: fileName, status: RecordingStatus.stoped));
      _setAudioUrl();
    });
    on<WriteFileToStorage>((event, emit) async {
      await _getStoragePermission();
      await _createFile();
      emit(state.copyWith(audioStatus: AudioPlayerStatus.stoped,status: RecordingStatus.initial));
    });
    on<ChangingNameFile>((event, emit) async {
      emit(state.copyWith(fileName: event.name));
    });
    on<GetFileFromStorage>((event, emit) async {
      final result = await FilePicker.platform.pickFiles();
      if (result != null) {
        file = File(result.files.single.path!);
        print(file?.path);
        String _baseName = basename(file!.path);
        emit(state.copyWith(
          fileCashePath: '${file?.path}',
          fileName: _baseName,
        ));
      } else {
        log('file is not open');
      }
    });
    on<PlayAudioFile>((event, emit) async {
      if (!state.isRecorderInitialised) return;
      emit(state.copyWith(audioStatus: AudioPlayerStatus.started));
      state.audioPlayer.play(state.fileCashePath);
    });
    on<StopAudioFile>((event, emit) async {
      if (!state.isRecorderInitialised) return;
      emit(state.copyWith(audioStatus: AudioPlayerStatus.stoped));
      state.audioPlayer.stop();

    });
    on<PauseAudioFile>((event, emit) async {
      if (!state.isRecorderInitialised) return;
      state.audioPlayer.pause();
      emit(state.copyWith(audioStatus: AudioPlayerStatus.paused));
    });
    on<ResumeAudioFile>((event, emit) async {
      if (!state.isRecorderInitialised) return;
      state.audioPlayer.resume();
      emit(state.copyWith(audioStatus: AudioPlayerStatus.started));
    });
    on<DeleteAudioFile>((event, emit) async {
      if (!state.isRecorderInitialised) return;
      state.audioPlayer.dispose();
      listAmplitude.clear();

      emit(state.copyWith(
          status: RecordingStatus.initial,
          recorderTime: '00' + ':' + '00' + ':' + '00',
          listAmplitude: listAmplitude));
    });
    on<SecDown>((event, emit) async {
      if (state.audioPosition.inSeconds >= 15) {
        state.audioPlayer.seek(
          state.audioPosition - const Duration(seconds: 15),
        );
      } else {
        state.audioPlayer.seek(
          state.audioPosition = const Duration(seconds: 0),
        );
      }
    });
    on<SecUp>((event, emit) async {
      if ((state.audioPosition.inSeconds - state.audioLength.inSeconds) <=
          -15) {
        state.audioPlayer.seek(
          state.audioPosition + const Duration(seconds: 15),
        );
      } else {
        state.audioPlayer.seek(
          state.audioPosition =
              Duration(seconds: state.audioLength.inSeconds - 0),
        );
      }
    });
    on<PlayListAudioFile>((event, emit) async {
      state.audioPlayer.release();
      emit(state.copyWith(audioStatus: AudioPlayerStatus.started));
      state.audioPlayer.play(event.url);

    });
  }

  Future<void> _setAudioUrl() async {
    state.audioPlayer.release();
    if (state.fileCashePath.isEmpty) return;
    await state.audioPlayer.setUrl(state.fileCashePath, isLocal: false);

    state.audioPlayer.onDurationChanged.listen((data) {
      emit(state.copyWith(audioLength: data));
    });

    state.audioPlayer.onAudioPositionChanged.listen((data) {
      emit(state.copyWith(audioPosition: data));
    });

    state.audioPlayer.onPlayerCompletion.listen((_) {
      emit(state.copyWith(audioPosition: const Duration(microseconds: 0)));
    });
  }

  Future<void> sekToSec(int sec) async {
    Duration newPosition = Duration(seconds: sec);
    state.audioPlayer.seek(newPosition);
  }

  Future<void> _createFile() async {
    File(state.storagePath + '/' + state.fileName)
        .create(recursive: true)
        .then((file) async {
      //переносим наш файл из кеша в сторидж
      File(state.fileCashePath).copy(state.storagePath + '/' + state.fileName);
      print(file.path);
      _audioFileBuilder.addAudioFileToFireStore(
        state.fileName,
        file.path,
        state.audioLength.toString(),
      );
      _dataBaseRepository.updateAudioListInUserModel();
    });

  }

  Future<void> _startTimer() async {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      const initSecond = 1;
      final seconds = state.duration.inSeconds + initSecond;
      emit(state.copyWith(duration: Duration(seconds: seconds)));
      String second =
          state.duration.inSeconds.remainder(60).toString().padLeft(2, '0');
      String minutes =
          state.duration.inMinutes.remainder(60).toString().padLeft(2, '0');
      String hour =
          state.duration.inHours.remainder(60).toString().padLeft(2, '0');
      emit(state.copyWith(recorderTime: hour + ':' + minutes + ':' + second));
    });
  }

  Future<void> _getAmplituder() async {
    timerAmplitude = Timer.periodic(
      const Duration(milliseconds: 40),
      (_) async {
        double plus = 0;
        Amplitude amplitude = await audioRecorder!.getAmplitude();
        plus++;
        state.copyWith(incWidth: plus);
        double dcb = amplitude.current + 45;
        if (dcb < 2) {
          dcb = 2;
        }
        log(dcb.toString());
        listAmplitude.add(dcb);
        emit(state.copyWith(listAmplitude: listAmplitude, dcd: dcb));
      },
    );
  }

  Future<void> _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      emit(state.copyWith(storagePermissionIsGranted: true));
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      emit(state.copyWith(storagePermissionIsGranted: false));
    }
  }

  //ДОделать нужно создать переменую в стейт и сохранит путь файла с из
  // функции крейтфайл

  Future<String> _generateFileName([int i = 1]) async {
    if (await File(state.storagePath + '/' + 'Запись №$i.aac').exists()) {
      return _generateFileName(i + 1);
    }
    return 'Запись №$i.aac';
  }
}
