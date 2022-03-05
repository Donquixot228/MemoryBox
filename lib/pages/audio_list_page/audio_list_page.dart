import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/repositories/database_repository/database_repository.dart';
import 'package:memorybox2/resources/resources.dart';
import 'package:memorybox2/widgets/widgets.dart';

class AudioListPage extends StatelessWidget {
  const AudioListPage();

  static const String routeName = '/audioListPage';

  static Widget create() {
    return const AudioListPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBaseRepository, UserModel>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.whiteColor,
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/images/backgroundVector/AudioZapisiVector.svg',
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 57,
                left: 5,
                child: appBarLending,
              ),
              Positioned(
                top: 57,
                right: 85,
                child: Text(
                  "Аудиозаписи",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 36),
                ),
              ),
              Positioned(
                top: 100,
                right: 117,
                child: Text(
                  "Все в одном месте",
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
                  icon: const Icon(Icons.more_horiz),
                  color: Colors.white,
                  iconSize: 35,
                ),
              ),
              const recordersTopButton(),
              Positioned(
                top: 250,
                left: 25,
                child: SingleChildScrollView(
                  child: Container(
                    width: 350,
                    height: 600,
                    child:  ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: state.audios.length,
                          itemBuilder: (context, index) {
                            return AudioCardPlay(
                              index: index,
                              audioUid: state.audios[index].uid,
                              audioName: state.audios[index].audioName,
                              audioUrl: state.audios[index].audioUrl,
                              audioDuration: state.audios[index].duration,
                            );
                          }),
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
