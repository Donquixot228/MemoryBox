import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/resources/resources.dart';


class SubscribePage extends StatefulWidget {
  const SubscribePage();

  static const String routeName = '/subscribePage';

  static Widget create() {
    return const SubscribePage();
  }

  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
  bool _isChosen = false;

  void _toggleFavorite() {
    setState(() {
      if (_isChosen) {
        _isChosen = false;
      } else {
        _isChosen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
            child: Builder(
              builder: (context) => IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: SvgPicture.asset(AppIcons.Fra, width: 25),
              ),
            ),
          ),
          const Positioned(
            top: 57,
            right: 123,
            child: Text(
              "Подписка",
              style: TextStyle(
                fontFamily: 'TTNorms-Bold',
                fontSize: 36,
                letterSpacing: 0.6,
                color: Colors.white,
              ),
            ),
          ),
          const Positioned(
            top: 100,
            right: 118,
            child: Text(
              'Расширь возможности',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "TTNorms-Medium",
                fontSize: 16,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 7,
            right: 7,
            child: Container(
              width: 404,
              height: 570,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.blueGrey,
                  ),
                ],
                color: Color(0xFFF6F6F6),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 34,
                  ),
                  const Text(
                    "Выбери подписку",
                    style: TextStyle(
                      fontFamily: 'TTNorms-Medium',
                      fontSize: 24,
                      letterSpacing: 0.6,
                      color: Color(0xFF3A3A55),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _toggleFavorite();
                            log('chosen 300 rub');
                          },
                          child: Container(
                            width: 163,
                            height: 240,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.grey,
                                ),
                              ],
                              color: Color(0xFFF6F6F6),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '300р  в месяц',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF3A3A55),
                                      fontSize: 24,
                                      fontFamily: "TTNorms-Regular"),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.all(10),
                                  child: (_isChosen
                                      ? SvgPicture.asset(AppIcons.Stroke)
                                      : SvgPicture.asset(
                                          AppIcons.Stroke,
                                          color: AppColors.whiteColor,
                                        )),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        GestureDetector(
                          onTap: () {
                            log('chosen  1800 rub');
                          },
                          child: Container(
                            width: 163,
                            height: 240,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.grey,
                                ),
                              ],
                              color: Color(0xFFF6F6F6),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '1800р  в год',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF3A3A55),
                                      fontSize: 24,
                                      fontFamily: "TTNorms-Regular"),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Column(
                      children: [
                        const Text(
                          'Что делает подписка: ',
                          style: TextStyle(
                              color: Color(0xFF3A3A55),
                              fontSize: 20,
                              fontFamily: "TTNorms-Medium"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            SvgPicture.asset(
                              AppIcons.infinity,
                              color: const Color(0xFF3A3A55),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Неограниченая память',
                              style: TextStyle(
                                  fontFamily: 'TTNorms-Regular',
                                  fontSize: 14,
                                  color: Color(0xFF3A3A55)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            SvgPicture.asset(
                              AppIcons.cloud_download,
                              color: const Color(0xFF3A3A55),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Все файлы хранятся в облаке',
                              style: TextStyle(
                                  fontFamily: 'TTNorms-Regular',
                                  fontSize: 14,
                                  color: Color(0xFF3A3A55)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            SvgPicture.asset(
                              AppIcons.PaperDownload,
                              color: const Color(0xFF3A3A55),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Возможность скачивать без ограничений',
                              style: TextStyle(
                                fontFamily: 'TTNorms-Regular',
                                fontSize: 14,
                                color: Color(0xFF3A3A55),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      elevation: 4,
                      primary: const Color(0xFFF1B488),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Подписаться на месяц',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'TTNorms-Medium',
                          letterSpacing: 0.1,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
