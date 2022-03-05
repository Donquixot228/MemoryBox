import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/cubits/navigation_index_cubit/navigation_index_cubit.dart';
import 'package:memorybox2/pages/home_page/home_page.dart';
import 'package:memorybox2/pages/pages.dart';
import 'package:memorybox2/services/locator.dart';
import 'package:memorybox2/services/navigation_service.dart';

class CustomDrawer extends StatelessWidget {


  const CustomDrawer();

  @override
  Widget build(BuildContext context) {
    InkWell buildDrawerButton({
      required String iconAsset,
      required String text,
      required VoidCallback function,
    }) {
      return InkWell(
        onTap: function,
        child: Container(
          height: 45,
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              SvgPicture.asset(
                iconAsset,
                width: 27,
              ),
              const SizedBox(width: 12),
              Text(text, style: Theme.of(context).textTheme.headline3),
            ],
          ),
        ),
      );
    }

    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<NavigationIndexCubit, NavigationIndexState>(
  builder: (context, state) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.28,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Аудиосказки',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 35),
                  Text(
                    'Меню',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 22,
                      color: const Color(0xFF3A3A55).withOpacity(0.5),
                    ),
                  )
                ],
              ),
            ),
            buildDrawerButton(
              iconAsset: 'assets/icons/Home.svg',
              text: 'Главная',
              function: () {
                locator<NavigationService>().navigateTo(HomePage.routeName);
                context.read<NavigationIndexCubit>().changeIndex(0);
                Navigator.pop(context);
              },
            ),
            buildDrawerButton(
                iconAsset: 'assets/icons/Profile.svg',
                text: 'Профиль',
                function: () {
                  locator<NavigationService>().navigateTo(ProfilePage.routeName);
                  context.read<NavigationIndexCubit>().changeIndex(4);
                  Navigator.pop(context);
                }),
            buildDrawerButton(
              iconAsset: 'assets/icons/Category.svg',
              text: 'Подборки',
              function: () {
                locator<NavigationService>().navigateTo(CollectionPage.routeName);
                context.read<NavigationIndexCubit>().changeIndex(1);
                Navigator.pop(context);
              },
            ),
            buildDrawerButton(
                iconAsset: 'assets/icons/Paper.svg',
                text: 'Все аудиофайлы',
                function: () {
                  locator<NavigationService>().navigateTo(AudioListPage.routeName);
                  context.read<NavigationIndexCubit>().changeIndex(3);
                  Navigator.pop(context);
                }
            ),
            buildDrawerButton(
                iconAsset: 'assets/icons/Search.svg',
                text: 'Поиск',
                function: () {
                  locator<NavigationService>().navigateTo(SearchPage.routeName);
                  context.read<NavigationIndexCubit>().changeIndex(0);
                  Navigator.pop(context);
                }
            ),
            buildDrawerButton(
                iconAsset: 'assets/icons/Delete.svg',
                text: 'Недавно удаленные',
                function: () {
                  locator<NavigationService>().navigateTo(DeletedPage.routeName);
                  context.read<NavigationIndexCubit>().changeIndex(0);
                  Navigator.pop(context);
                }
            ),
            const SizedBox(height: 20),
            buildDrawerButton(
                iconAsset: 'assets/icons/Wallet.svg',
                text: 'Подписка',
                function: () {
                  locator<NavigationService>().navigateTo(SearchPage.routeName);
                  context.read<NavigationIndexCubit>().changeIndex(0);
                  Navigator.pop(context);
                }
            ),
            const SizedBox(height: 30),
            buildDrawerButton(
              iconAsset: 'assets/icons/Edit.svg',
              text: 'Написать в\nподдержку',
              function: () {},
            ),
          ],
        ),
      ),
    );
  },
);
  }
}