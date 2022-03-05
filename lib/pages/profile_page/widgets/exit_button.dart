import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:memorybox2/blocs/profile_bloc/profile_bloc.dart';
import 'package:provider/src/provider.dart';

import '../../pages.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<ProfileBloc>().add(SignOut());
         SystemNavigator.pop();
        //Navigator.pushNamed(context, WelcomePage.routeName);
      },
      child: Text(
        'Выйти из приложения',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
