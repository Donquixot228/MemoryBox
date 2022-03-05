import 'package:memorybox2/blocs/recording_bloc/recording_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/pages/record_page/widgets/record_text_field.dart';
import 'package:memorybox2/resources/resources.dart';
import 'package:memorybox2/widgets/widgets.dart';
import 'package:rive/rive.dart';
import 'package:share/share.dart';

class RecordPage extends StatelessWidget {
  const RecordPage();
  static const String routeName = '/recordPage';

  static Widget create() {
    return const RecordPage();
  }

  @override
  Widget build(BuildContext context) {
    context.read<RecordingBloc>().add(OpenSession());
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFF6F6F6),
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/backgroundVector/Vector.svg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 57,
            left: 5,
            child: appBarLending,
          ),
          Positioned(
            top: 185,
            left: 7,
            right: 7,
            child: Container(
              width: 404,
              height: 560,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.blueGrey,
                  ),
                ],
                color: Color(0xFFF6F6F6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: kBottomNavigationBarHeight - 25),
                child: BlocBuilder<RecordingBloc, RecordingState>(
                  builder: (context, recordingState) {
                    if (recordingState.status == RecordingStatus.initial) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 400,
                                height: 300,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                  ),
                                ),
                                child: const RiveAnimation.asset(
                                  'assets/animations/voice.riv',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          //
                          Text(
                            "Нажмите на эту кнопку для начала записи",
                            style: Theme.of(context).textTheme.headline5,
                            textAlign: TextAlign.center,
                          ),
                          const Expanded(child: SizedBox()),
                          const SizedBox(
                            width: 50,
                            height: 50,
                            child: RiveAnimation.asset(
                              'assets/animations/row.riv',
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          IconButton(
                            padding: const EdgeInsets.only(bottom: 0),
                            icon: SvgPicture.asset(AppIcons.PlayOrange),
                            iconSize: 60,
                            onPressed: () {
                              context
                                  .read<RecordingBloc>()
                                  .add(StartRecorder());
                            },
                          ),
                          Container(
                            height: 30,
                            width: 3,
                            color: AppColors.sendColor,
                          ),
                        ],
                      );
                    }
                    if (recordingState.status == RecordingStatus.started) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, right: 10, bottom: 20),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Отменить',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Запись',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          VoiceAnimation(),
                          const Expanded(
                            child: SizedBox(
                              height: 100,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 135, bottom: 10),
                            child: Row(
                              children: [
                                //Анимация красной точки
                                Container(
                                  padding: const EdgeInsets.only(right: 2),
                                  width: 30,
                                  height: 30,
                                  child: const RiveAnimation.asset(
                                    'assets/animations/dot.riv',
                                  ),
                                ),
                                //Таймер
                                SizedBox(
                                  height: 20,
                                  child: Text(
                                    recordingState.recorderTime,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColors.sendColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.pause,
                                color: Colors.white,
                              ),
                              iconSize: 30,
                              onPressed: () {
                                context
                                    .read<RecordingBloc>()
                                    .add(StopRecorder());
                              },
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 3,
                            color: AppColors.sendColor,
                          ),
                        ],
                      );
                    }
                    if (recordingState.status == RecordingStatus.stoped) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: SvgPicture.asset(AppIcons.Share),
                                  onPressed: () {
                                    Share.shareFiles([
                                      context
                                          .read<RecordingBloc>()
                                          .state
                                          .fileCashePath
                                    ]);
                                  },
                                ),
                                IconButton(
                                  icon: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: SvgPicture.asset(
                                      AppIcons.PaperDownload,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  onPressed: () {
                                    context
                                        .read<RecordingBloc>()
                                        .add(GetFileFromStorage());
                                  },
                                ),
                                BlocBuilder<RecordingBloc, RecordingState>(
                                  builder: (context, state) {
                                    return IconButton(
                                      icon: SvgPicture.asset(AppIcons.Delete),
                                      onPressed: () {
                                         context.read<RecordingBloc>().add(DeleteAudioFile());
                                      },
                                    );
                                  },
                                ),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<RecordingBloc>()
                                        .add(WriteFileToStorage());
        //////////////////////////////////                          //  setIndex(3);
                                  },
                                  child: Text(
                                    'Сохранить',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                SizedBox(
                                    width: 200,
                                    height: 40,
                                    child: RecordingTextField(showLine: false)),
                                const SizedBox(
                                  height: 20,
                                ),
                                //вместо него
                                const AudioLineIndicator(),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              BlocBuilder<RecordingBloc, RecordingState>(
                                builder: (context, state) {
                                  return IconButton(
                                    icon: SvgPicture.asset(AppIcons.Back_15),
                                    onPressed: () {
                                      context
                                          .read<RecordingBloc>()
                                          .add(SecDown());
                                    },
                                  );
                                },
                              ),
                              BlocBuilder<RecordingBloc, RecordingState>(
                                builder: (context, state) {
                                  if (state.audioStatus ==
                                      AudioPlayerStatus.stoped) {
                                    return IconButton(
                                      icon:
                                          SvgPicture.asset(AppIcons.PlayOrange),
                                      iconSize: 60,
                                      onPressed: () {
                                        context
                                            .read<RecordingBloc>()
                                            .add(PlayAudioFile());
                                      },
                                    );
                                  }
                                  if (state.audioStatus ==
                                      AudioPlayerStatus.started) {
                                    return IconButton(
                                      icon: const Icon(Icons.pause),
                                      iconSize: 60,
                                      onPressed: () {
                                        context
                                            .read<RecordingBloc>()
                                            .add(StopAudioFile());
                                      },
                                    );
                                  }
                                  // if (state.audioStatus ==
                                  //     AudioPlayerStatus.paused ) {
                                  //   return IconButton(
                                  //     icon: Icon(Icons.ac_unit),
                                  //     iconSize: 60,
                                  //     onPressed: () {
                                  //       context
                                  //           .read<RecordingBloc>()
                                  //           .add(ResumeAudioFile());
                                  //     },
                                  //   );
                                  // }
                                  else {
                                    return const CircularProgressIndicator();
                                  }
                                },
                              ),
                              BlocBuilder<RecordingBloc, RecordingState>(
                                builder: (context, state) {
                                  return IconButton(
                                    icon: SvgPicture.asset(AppIcons.Front_15),
                                    onPressed: () {
                                      context
                                          .read<RecordingBloc>()
                                          .add(SecUp());
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AudioLineIndicator extends StatelessWidget {
  const AudioLineIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordingBloc, RecordingState>(
      builder: (context, state) {
        return Column(
          children: [
            const SliderAudioPlayer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${state.audioPosition.inMinutes.remainder(60).toString().padLeft(2, '0')}:${state.audioPosition.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    '${state.audioLength.inMinutes.remainder(60).toString().padLeft(2, '0')}:${state.audioLength.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
    //  Divider(color: Colors.black,endIndent: 40,indent: 40,height: 10,thickness: 5,);
  }
}

class SliderAudioPlayer extends StatelessWidget {
  const SliderAudioPlayer();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordingBloc, RecordingState>(
  builder: (context, state) {
    return Column(
      children: [
        SliderTheme(
          data: const SliderThemeData(
            trackHeight: 1,
            inactiveTrackColor: Colors.black,
            activeTrackColor: Colors.black,
            thumbColor: Colors.black,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
          ),
          child: Slider.adaptive(
              value: state.audioPosition.inSeconds.toDouble(),
              max:  state.audioLength.inSeconds.toDouble(),
              onChanged: (val) {
                context.read<RecordingBloc>().sekToSec(val.toInt());
              }),
        ),
      ],
    );
  },
);
  }
}

class VoiceAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return BlocBuilder<RecordingBloc, RecordingState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            reverse: true,
            controller: _scrollController,
            itemCount: state.listAmplitude.length,
            itemBuilder: (BuildContext context, int index) {
              _scrollController
                  .jumpTo(_scrollController.position.maxScrollExtent);
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 50),
                    height: state.listAmplitude[index],
                    width: 2,
                    curve: Curves.easeInBack,
                    color: AppColors.textColor,
                  ),
                  SizedBox(
                    width: 2,
                    height: 2,
                    child: Container(
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

// class VoiceAnimation2 extends StatefulWidget {
//   @override
//   State<VoiceAnimation2> createState() => _VoiceAnimation2State();
// }
//
// class _VoiceAnimation2State extends State<VoiceAnimation2> {
//   SMIInput<double>? _progress;
//   Artboard? _riveArtboard;
//   StateMachineController? _controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     rootBundle.load('assets/animations/voice_rec.riv').then(
//       (data) async {
//         final file = RiveFile.import(data);
//         final artboard = file.mainArtboard;
//         var controller = StateMachineController.fromArtboard(artboard, 'Voice');
//         if (controller != null) {
//           artboard.addController(controller);
//           _progress = controller.findInput('Level');
//         }
//         setState((){
//           _riveArtboard = artboard;
//           _progress?.value = context.read<RecordingBloc>().state.dcd;
//         }
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//         return Container(
//           width: 400,
//           height: 200,
//           child: Rive(
//             artboard: _riveArtboard!,
//             alignment: Alignment.center,
//           ),
//         );
//       },
//     );
//   }
// }
