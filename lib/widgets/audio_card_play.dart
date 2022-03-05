import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/blocs/recording_bloc/recording_bloc.dart';
import 'package:memorybox2/resources/resources.dart';

class AudioCardPlay extends StatelessWidget {
  final String? audioName;
  final String? audioDuration;
  final int? index;
  final Color? colorButton;
  final String? audioUrl;
  final String? audioUid;

  const AudioCardPlay({
    Key? key,
    required this.audioDuration,
    required this.audioName,
    required this.index,
    this.colorButton,
    required this.audioUrl,
    required this.audioUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: Card(
        color: AppColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ButtonPlay(index: index!, audioUrl: audioUrl!,),
              NameAndDurationWidget(
                audioDuration: audioDuration!,
                audioName: audioName!,
                index: index!,
                uidAudio: audioUid!,
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black12,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

class ButtonPlay extends StatelessWidget {
  final int index;
  final String audioUrl;

  const ButtonPlay({
    Key? key,
    required this.index,
    required this.audioUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordingBloc, RecordingState>(
      builder: (context, state) {
        return ClipOval(
          child: Container(
            width: 60,
            height: 60,
            child: state.audioStatus == AudioPlayerStatus.stoped ? IconButton(
              icon: SvgPicture.asset(
                AppIcons.PlayBlue,
              ),
              color: Colors.white,
              onPressed: () {
                context.read<RecordingBloc>().add(PlayListAudioFile(audioUrl));
              },
            ) : IconButton(
              icon: const Icon(
                Icons.pause,
                color: Colors.white,
              ),
              iconSize: 30,
              onPressed: () {
                context
                    .read<RecordingBloc>()
                    .add(StopAudioFile());

              },
            ),

          ),
        );
      },
    );
  }
}

class NameAndDurationWidget extends StatelessWidget {
  final String audioName;
  final String audioDuration;
  final int index;
  final String uidAudio;

  const NameAndDurationWidget({
    Key? key,
    required this.audioName,
    required this.audioDuration,
    required this.index,
    required this.uidAudio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController? _textEditingController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 220,
          height: 20,
          child: Text(
            audioName,
            style: Theme
                .of(context)
                .textTheme
                .headline1,
          ),
        ),
        Text(
          audioDuration.substring(0, 7),
          style: Theme
              .of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
