import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorybox2/cubits/auth_cubit/signup_cubit.dart';
import 'package:memorybox2/resources/resources.dart';


class phone_enter_field extends StatelessWidget {
  final bool phonefield;

  const phone_enter_field({
    Key? key,
    required this.phonefield,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
      child: TextField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[+,\d]+')),
        ],
        onChanged: (value) {
          if (phonefield) {
            context.read<SignupCubit>().phoneChanged(value);
            log('$value');
          }
          else{
            context.read<SignupCubit>().smsCodeChanged(value);
            log('$value');
          }
        },
        keyboardType: TextInputType.phone,
        showCursor: false,
        enableInteractiveSelection: true,
        obscureText: false,
        obscuringCharacter: '*',
        textAlign: TextAlign.center,
        style: Theme
            .of(context)
            .textTheme
            .headline4!
            .copyWith(
          color: AppColors.textColor,
        ),
        decoration: InputDecoration(
          hintText: phonefield ? "+380..." : '0000',
          filled: true,
          fillColor: Color(0xFFF6F6F6),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                color: Colors.grey, width: 5, style: BorderStyle.none),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                color: Colors.grey, width: 5, style: BorderStyle.none),
          ),
        ),
      ),
    );
  }
}
