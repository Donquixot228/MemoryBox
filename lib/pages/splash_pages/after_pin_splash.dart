import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/pages/pages.dart';
import 'package:memorybox2/repositories/database_repository/database_repository.dart';
import 'package:memorybox2/resources/resources.dart';


class AfterPinSplash extends StatefulWidget {
  AfterPinSplash({Key? key}) : super(key: key);

  static const String routeName = '/afterPinSplash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocBuilder<DataBaseRepository, UserModel>(
        builder: (context, state) {
          return AfterPinSplash();
        },
      ),
    );
  }

  @override
  State<AfterPinSplash> createState() => _AfterPinSplashState();
}

class _AfterPinSplashState extends State<AfterPinSplash> {
  void initState() {
    context.read<DataBaseRepository>().setNewUserInfoToFB().then(
          (value) => Future.delayed(Duration(milliseconds: 1500), () {
            Navigator.pushNamed(context, ControllerPage.routeName);
          }),
        );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                    child: Center(
                      child: Text(
                        'Ты супер!',
                        style: Theme.of(context).textTheme.headline6,
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
                      child: Text("Мы рады тебя видеть",
                          style: Theme.of(context).textTheme.headline5),
                    ),
                  ),
                  SizedBox(
                    height: 59,
                  ),
                  SvgPicture.asset(AppIcons.Heart),
                  SizedBox(
                    height: 110,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
