import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/cubits/navigation_index_cubit/navigation_index_cubit.dart';
import 'package:memorybox2/pages/pages.dart';
import 'package:memorybox2/resources/resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorybox2/services/locator.dart';
import 'package:memorybox2/services/navigation_service.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation();

  Radius radius = const Radius.circular(25);
  TextStyle textStyle = const TextStyle(
    fontFamily: 'TTNorms-Medium',
    color: AppColors.textColor,
    fontSize: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: radius, topRight: radius),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: radius,
          topLeft: radius,
        ),
        child: BlocBuilder<NavigationIndexCubit, NavigationIndexState>(
          builder: (context, state) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: textStyle,
              unselectedLabelStyle: textStyle,
              currentIndex: state.currentIndex,
              selectedItemColor: AppColors.purpleColor,
              onTap: (index) {
                switch (index) {
                  case 0:
                    locator<NavigationService>().navigateTo(HomePage.routeName);
                    context.read<NavigationIndexCubit>().changeIndex(index);
                    log('${index}\n ${state.currentIndex}');
                    break;
                  case 1:
                    locator<NavigationService>()
                        .navigateTo(CollectionPage.routeName);
                    context.read<NavigationIndexCubit>().changeIndex(index);
                    log('${index}\n ${state.currentIndex}');
                    break;
                  case 2:
                    locator<NavigationService>()
                        .navigateTo(RecordPage.routeName);
                    context.read<NavigationIndexCubit>().changeIndex(index);
                    log('${index}\n ${state.currentIndex}');
                    break;
                  case 3:
                    locator<NavigationService>()
                        .navigateTo(AudioListPage.routeName);
                    context.read<NavigationIndexCubit>().changeIndex(index);
                    log('${index}\n ${state.currentIndex}');
                    break;
                  case 4:
                    locator<NavigationService>()
                        .navigateTo(ProfilePage.routeName);
                    context.read<NavigationIndexCubit>().changeIndex(index);
                    log('${index}\n ${state.currentIndex}');
                    break;
                }
              },
              items: [
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    AppIcons.Home,
                    color: AppColors.purpleColor,
                  ),
                  icon: SvgPicture.asset(AppIcons.Home),
                  label: 'Главная',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    AppIcons.Category,
                    color: AppColors.purpleColor,
                  ),
                  icon: SvgPicture.asset(AppIcons.Category),
                  label: 'Подборки',
                ),
                BottomNavigationBarItem(
                  activeIcon: Container(
                    height: 46,
                    width: 46,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1B488),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: Column(
                    children: [
                      Container(
                        height: 46,
                        width: 46,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1B488),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.Voice,
                        ),
                      ),
                    ],
                  ),
                  label: 'Запись',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    AppIcons.Paper,
                    color: AppColors.purpleColor,
                  ),
                  icon: SvgPicture.asset(AppIcons.Paper),
                  label: 'Аудиозаписи',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    AppIcons.Profile,
                    color: AppColors.purpleColor,
                  ),
                  icon: SvgPicture.asset(AppIcons.Profile),
                  label: 'Профиль',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
