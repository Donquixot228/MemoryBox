import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/blocs/profile_bloc/profile_bloc.dart';
import 'package:memorybox2/pages/profile_page/widgets/delete_button.dart';
import 'package:memorybox2/pages/profile_page/widgets/exit_button.dart';
import 'package:memorybox2/pages/profile_page/widgets/imagePicker_profile.dart';
import 'package:memorybox2/pages/profile_page/widgets/memory_indicator.dart';
import 'package:memorybox2/pages/profile_page/widgets/phone_filed.dart';
import 'package:memorybox2/pages/profile_page/widgets/text_field.dart';
import 'package:memorybox2/repositories/database_repository/database_repository.dart';
import 'package:memorybox2/resources/resources.dart';
import 'package:memorybox2/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();

  static const String routeName = '/profilePage';

  static Widget create() {
    return  const ProfilePage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.whiteColor,
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/backgroundVector/Vector.svg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 57,
            left: 5,
            child: appBarLending,
          ),
          Positioned(
            top: 57,
            right: 123,
            child: Text(
              "Профиль",
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 36),
            ),
          ),
          Positioned(
            top: 100,
            right: 150,
            child: Text(
              'твоя частичка',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Positioned(
            top: 150,
            left: 85,
            child: ImagePickerProfile(),
          ),
          Positioned(
            top: 390,
            left: 100,
            child: SizedBox(
              height: 50,
              width: 200,
              child: ProfileTextField(
                showLine: true,
              ),
            ),
          ),
          Positioned(
            top: 460,
            left: 40,
            child: ProfilePhoneField(
              showLine: false,
            ),
          ),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return Positioned(
                top: 530,
                left: 130,
                child: state == ProfileInitial()
                    ? TextButton(
                        onPressed: () {
                          context.read<ProfileBloc>().add(ProfileEdit());
                        },
                        child: Text(
                          'Редактировать',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          context.read<ProfileBloc>().add(ProfileSave());
                        },
                        child: Text(
                          'Сохранить',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
              );
            },
          ),
          //Botom 2 Button
          Positioned(
            top: 576,
            left: 153,
            child: TextButton(
              onPressed: () {
       ////////////////////////////         setIndex(7);
              },
              child: Text(
                'Подписка',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
          Positioned(
            top: 614,
            left: 10,
            right: 10,
            child: ProfileMemoryAccess(),
          ),
          Positioned(
            top: 640,
            left: 160,
            child: BlocBuilder<DataBaseRepository, UserModel>(
              builder: (context, state) {
                return Text('${state.accessMemory}/500 мб',
                    style: Theme.of(context).textTheme.headline1);
              },
            ),
          ),
          //
          Positioned(
            top: MediaQuery.of(context).size.height * 0.8 + 20,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ExitButton(),
                DeleteButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
