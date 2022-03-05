
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:memorybox2/repositories/database_repository/database_repository.dart';
import 'package:memorybox2/resources/resources.dart';

class ProfileMemoryAccess extends StatelessWidget {
  ProfileMemoryAccess();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBaseRepository, UserModel>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 20,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: const [
                AppColors.sendColor,
                AppColors.whiteColor,
              ],
              stops: [state.accessMemory / 500, state.accessMemory / 500],
            ),
          ),
        );
      },
    );
  }
}