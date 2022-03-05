import 'package:flutter/material.dart';
import 'package:memorybox2/blocs/profile_bloc/profile_bloc.dart';
import 'package:memorybox2/pages/pages.dart';


import 'package:provider/src/provider.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    'Точно удалить аккаунт?',
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                  content: Container(
                    width: 150,
                    child: Text(
                      'Все аудиофайлы исчезнут и восстановить аккаунт будет невозможно',
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25))),
                              minimumSize:
                                  MaterialStateProperty.all(Size(124, 41)),
                              backgroundColor: MaterialStateProperty.all(
                                Color(0xFFE27777),
                              ),
                            ),
                            onPressed: () {
                              context.read<ProfileBloc>().add(DeleteAcc());
                              Navigator.pushNamed(
                                  context, WelcomePage.routeName);
                            },
                            child: Text(
                              'Удалить',
                              style: Theme.of(context).textTheme.subtitle2,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          child: Text(
                            'Нет',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Color(0xff8C84E2)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(84, 41)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(color: Color(0xff8C84E2)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ));
      },
      child: Text(
        'Удалить аккаунт',
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: Color(0xFFE27777),
            ),
      ),
    );
  }
}
