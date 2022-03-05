import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/pages/pages.dart';
import 'package:memorybox2/repositories/database_repository/database_repository.dart';
import 'package:memorybox2/resources/resources.dart';
import 'package:memorybox2/services/locator.dart';
import 'package:memorybox2/services/navigation_service.dart';

class PermanentUserSplash extends StatefulWidget {
 const PermanentUserSplash();

  static const String routeName = '/permanentSplash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocBuilder<DataBaseRepository, UserModel>(
        builder: (context, state) {
          return PermanentUserSplash();
        },
      ),
    );
  }

  @override
  State<PermanentUserSplash> createState() => _PermanentUserSplashState();
}

class _PermanentUserSplashState extends State<PermanentUserSplash> {
  @override
  void initState() {
    context.read<DataBaseRepository>().getUserInfoFromFB().then(
          (value) => Future.delayed(Duration(milliseconds: 1500), () {
           Navigator.pushNamed(context, ControllerPage.routeName);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.whiteColor,
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/backgroundVector/Vector.svg',
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Container(
                  height: 330,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 120, right: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'MemoryBox',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          'Твой голос всегда рядом',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  color: AppColors.whiteColor,
                  elevation: 5,
                  shadowColor: Colors.grey.shade100,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Мы рады тебя видеть",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SvgPicture.asset(AppIcons.Heart),
                SizedBox(
                  height: 90,
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  color: AppColors.whiteColor,
                  elevation: 5,
                  shadowColor: Colors.grey.shade100,
                  child: Container(
                    margin: EdgeInsets.only(left: 17),
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Взрослые иногда нуждаются в сказке даже больше, чем дети",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
