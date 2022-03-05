import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/resources/resources.dart';

Widget appBarLending = Builder(builder: (scaffoldContext) {
  return IconButton(
    onPressed: () => Scaffold.of(scaffoldContext).openDrawer(),
    icon: SvgPicture.asset(
      AppIcons.Fra,
      height: 18,
    ),
  );
});
