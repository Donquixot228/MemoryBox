import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/cubits/audio_builder_cubit/audio_file_builder_cubit.dart';
import 'package:memorybox2/models/audio_model.dart';
import 'package:memorybox2/resources/resources.dart';
import 'package:memorybox2/widgets/search_field.dart';
import 'package:memorybox2/widgets/widgets.dart';
import 'package:rive/rive.dart';

class SearchPage extends StatelessWidget {
  const SearchPage();

  static const String routeName = '/searchPage';

  static Widget create() {
    return const SearchPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioFileBuilder, AudioFileBuilderState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.whiteColor,
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/images/backgroundVector/SearchVector.svg',
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 57,
                left: 5,
                child: appBarLending,
              ),
              Positioned(
                top: 57,
                right: 145,
                child: Text(
                  "Поиск",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 36),
                ),
              ),
              Positioned(
                top: 100,
                right: 125,
                child: Text(
                  "Найди потеряшку",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontFamily: 'TTNorms-Bold'),
                ),
              ),
              Positioned(
                top: 57,
                right: 16,
                child: IconButton(
                  onPressed: () {
                    log('asdf');
                  },
                  icon: Icon(Icons.more_horiz),
                  color: Colors.white,
                  iconSize: 35,
                ),
              ),
              searchField(),
              Positioned(
                top: 250,
                left: 25,
                child: Container(
                  width: 350,
                  height: 600,
                  child: StreamBuilder<Object>(
                    stream: context
                        .read<AudioFileBuilder>()
                        .searchAudio(state.searchKey),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<AudioModel> _audios =
                            snapshot.data as List<AudioModel>;
                        return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return AudioCardPlay(
                                audioDuration: _audios[index].duration,
                                audioName: _audios[index].audioName,
                                index: index,
                                audioUrl: _audios[index].audioUrl,
                                audioUid: _audios[index].uid,
                              );
                            });
                      } else {
                        return Column(
                          children: [
                            Container(
                              width: 250,
                              height: 250,
                              child: RiveAnimation.asset(
                                'assets/animations/play_pause_button.riv',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text(
                              "Нажмите на эту кнопку для начала записи",
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: 100,
                              height: 100,
                              child: RiveAnimation.asset(
                                'assets/animations/row.riv',
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              height: kBottomNavigationBarHeight,
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
