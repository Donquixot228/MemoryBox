

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorybox2/blocs/profile_bloc/profile_bloc.dart';
import 'package:memorybox2/repositories/database_repository/database_repository.dart';

class ProfileTextField extends StatelessWidget {
  ProfileTextField({required this.showLine});

  TextInputType keyboardType = TextInputType.name;
  bool showLine = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        return BlocBuilder<DataBaseRepository, UserModel>(
          builder: (context, userState) {
            return TextField(
              cursorColor: Colors.black45,
              textAlign: TextAlign.center,
              enabled: profileState == ProfileInitial() ? false : true,
              keyboardType: keyboardType,
              style:
              Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20),
              onChanged: (name) {
                context.read<ProfileBloc>().add(ProfileEditName(name));
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: userState.name == '' ? "Твое имя" : userState.name,
                hintStyle: Theme.of(context).textTheme.headline5,
                contentPadding: const EdgeInsets.only(top: 10),
                focusedBorder: showLine
                    ? const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0x803A3A55)))
                    : null,
                enabledBorder: showLine
                    ? const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0x803A3A55)))
                    : null,
              ),
            );
          },
        );
      },
    );
  }
}
