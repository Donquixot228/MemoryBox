import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/cubits/auth_cubit/signup_cubit.dart';
import 'package:memorybox2/resources/resources.dart';
import 'package:memorybox2/widgets/widgets.dart';


class PinEnterPage extends StatelessWidget {
  PinEnterPage();

  static const String routeName = '/pinEnter';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          return PinEnterPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/images/backgroundVector/Vector.svg',
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 330,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(top: 120),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Регистрация',
                              style: Theme.of(context).textTheme.headline6),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Введи код из смс, чтобы мы  тебя запомнили',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        phone_enter_field(
                          phonefield: false,
                        ),
                        SizedBox(
                          height: 66,
                        ),
                        continue_Button(
                          isPin: true,
                          isPhone: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<SignupCubit>().signUpAnon();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.whiteColor,
                            primary: Color(0xFFACACAC),
                          ),
                          child: Text(
                            'Позже',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          color: Color(0xFFF6F6F6),
                          elevation: 5,
                          shadowColor: Colors.grey.shade100,
                          child: Container(
                            width: 284,
                            height: 90,
                            alignment: Alignment.center,
                            child: Text(
                              "Регистрация привяжет твои сказки к облаку, после чего они всегда  будут с тобой",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ),
                      ],
                    ),
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
