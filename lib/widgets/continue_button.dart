import 'package:flutter/material.dart';
import 'package:memorybox2/cubits/auth_cubit/signup_cubit.dart';
import 'package:memorybox2/pages/pages.dart';
import 'package:memorybox2/resources/resources.dart';

import 'package:provider/src/provider.dart';

class continue_Button extends StatelessWidget {
  final bool isPhone;
  final bool isPin;

  continue_Button({
    Key? key,
    this.isPhone = false,
    this.isPin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (isPhone == true && isPin == false) {
          Navigator.pushNamed(context, PinEnterPage.routeName);
          context.read<SignupCubit>().verifyPhone(context);
        }
        if (isPin == true && isPhone == false) {
          await context.read<SignupCubit>().signupAndVerifyCode(context).then(
                (value) =>
                    Navigator.pushNamed(context, AfterPinSplash.routeName),
              );
        }
        if (isPin == false && isPhone == false) {
          Navigator.pushNamed(context, PhoneEnterPage.routeName);
        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        elevation: 4,
        primary: Color(0xFFF1B488),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        'Продолжить',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline3!.copyWith(
              color: AppColors.whiteColor,
            ),
      ),
    );
  }
}
