part of 'recording_bloc.dart';

enum RecordingStatus { initial, started, stoped, cancel }
enum AudioPlayerStatus { started, stoped, resume, paused }

class RecordingState {
  //Audio RECORDING
  final double dcd;
  final RecordingStatus status;
  final String storagePath;
  final double incWidth;
  final bool isRecorderInitialised;
  final bool storagePermissionIsGranted;
  final String fileName;
  final String recorderTime; // 00:00:0
  final String fileCashePath;
  final List listAmplitude;
  final Duration duration;

  // Audio PLAYER
  Duration audioPosition;
  Duration audioLength;
  AudioPlayer audioPlayer = AudioPlayer();
  final AudioPlayerStatus audioStatus;

  //
  RecordingState({
    this.duration = const Duration(),
    this.audioStatus = AudioPlayerStatus.stoped,
    this.dcd = 0,
    this.audioPosition = const Duration(),
    this.audioLength = const Duration(),
    this.fileName = '',
    this.fileCashePath = '',
    this.isRecorderInitialised = false,
    this.incWidth = 0,
    this.storagePath = '',
    this.listAmplitude = const [],
    this.storagePermissionIsGranted = false,
    this.recorderTime = '00:00:0',
    this.status = RecordingStatus.initial,
  });

  RecordingState copyWith(
      {AudioPlayerStatus? audioStatus,
      double? dcd,
      RecordingStatus? status,
      Duration? duration,
      Duration? audioPosition,
      Duration? audioLength,
      List? listAmplitude,
      String? storagePath,
      bool? isRecorderInitialised,
      double? incWidth,
      Amplitude? amplitude,
      bool? storagePermissionIsGranted,
      String? fileCashePath,
      String? fileName,
      String? recorderTime}) {
    return RecordingState(
      audioPosition: audioPosition ?? this.audioPosition,
      audioLength: audioLength ?? this.audioLength,
      audioStatus: audioStatus ?? this.audioStatus,
      dcd: dcd ?? this.dcd,
      fileName: fileName ?? this.fileName,
      status: status ?? this.status,
      listAmplitude: listAmplitude ?? this.listAmplitude,
      storagePath: storagePath ?? this.storagePath,
      incWidth: incWidth ?? this.incWidth,
      isRecorderInitialised:
          isRecorderInitialised ?? this.isRecorderInitialised,
      storagePermissionIsGranted:
          storagePermissionIsGranted ?? this.storagePermissionIsGranted,
      fileCashePath: fileCashePath ?? this.fileCashePath,
      duration: duration ?? this.duration,
      recorderTime: recorderTime ?? this.recorderTime,
    );
  }
}
