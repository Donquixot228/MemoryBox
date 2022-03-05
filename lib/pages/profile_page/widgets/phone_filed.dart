import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorybox2/blocs/profile_bloc/profile_bloc.dart';
import 'package:memorybox2/repositories/database_repository/database_repository.dart';
import 'package:memorybox2/resources/resources.dart';


class ProfilePhoneField extends StatelessWidget {
  ProfilePhoneField({required this.showLine});

  bool showLine = false;
  String phone = '';
  String pin = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: SizedBox(
        height: 60,
        width: 300,
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, profileState) {
            return BlocBuilder<DataBaseRepository, UserModel>(
              builder: (context, userState) {
                if (profileState is ProfileInitial) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.whiteColor),
                    alignment: Alignment.center,
                    child: Text('${userState.phone}',
                        style: Theme.of(context).textTheme.headline3),
                  );
                }
                if (profileState is ProfileEditing) {
                  return InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.whiteColor),
                      alignment: Alignment.center,
                      child: Text('${userState.phone}',
                          style: Theme.of(context).textTheme.headline3),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                            height: 250,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Введите новый номер',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Material(
                                    elevation: 10,
                                    borderRadius: BorderRadius.circular(30),
                                    child: TextField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[+,\d]+')),
                                      ],
                                      onChanged: (value) {
                                        phone = value;
                                      },
                                      keyboardType: TextInputType.phone,
                                      showCursor: false,
                                      enableInteractiveSelection: true,
                                      obscureText: false,
                                      obscuringCharacter: '*',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                            color: AppColors.textColor,
                                          ),
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.send),
                                          onPressed: () {
                                            context.read<ProfileBloc>().add(
                                                ProfileSetNewPhoneNumber(
                                                    phone));
                                          },
                                        ),
                                        hintText: '+38000',
                                        filled: true,
                                        fillColor: Color(0xFFF6F6F6),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.grey,
                                              width: 5,
                                              style: BorderStyle.none),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.grey,
                                              width: 5,
                                              style: BorderStyle.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Введите пин код',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Material(
                                    elevation: 10,
                                    borderRadius: BorderRadius.circular(30),
                                    child: TextField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[+,\d]+')),
                                      ],
                                      onChanged: (value) {
                                        pin = value;
                                      },
                                      keyboardType: TextInputType.phone,
                                      showCursor: false,
                                      enableInteractiveSelection: true,
                                      obscureText: true,
                                      obscuringCharacter: '*',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                            color: AppColors.textColor,
                                          ),
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.send),
                                          onPressed: () {
                                            context.read<ProfileBloc>().add(
                                                UpdateSetNewPhoneNumber(
                                                    pin, phone));
                                          },
                                        ),
                                        hintText: '0000',
                                        filled: true,
                                        fillColor: Color(0xFFF6F6F6),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.grey,
                                              width: 5,
                                              style: BorderStyle.none),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                              color: Colors.grey,
                                              width: 5,
                                              style: BorderStyle.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
