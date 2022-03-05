
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/resources/resources.dart';

class recordersTopButton extends StatelessWidget {
  const recordersTopButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 150,
      left: 20,
      child: Row(
        children: [
          Text(
            ' 20 аудио  10:30 часов',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(
            width: 35,
          ),
          Stack(
            children: [
              Container(
                width: 222,
                height: 46,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 7),
                child: IconButton(
                  onPressed: () {
                    log('dada');
                  },
                  icon: SvgPicture.asset('assets/icons/Group.svg'),
                ),
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
              Container(
                width: 170,
                height: 46,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        log('Blue button');
                      },
                      icon: SvgPicture.asset(
                        AppIcons.Play,
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(1),
                    ),
                    Text(
                      'Запустить все',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Color(0xFF8C84E2)),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
