import 'package:flutter/material.dart';

import 'package:memorybox2/blocs/recording_bloc/recording_bloc.dart';
import 'package:memorybox2/routes/app_router.dart';
import 'package:memorybox2/services/locator.dart';
import 'package:memorybox2/services/navigation_service.dart';
import 'package:memorybox2/widgets/widgets.dart';

import 'pages.dart';

class ControllerPage extends StatelessWidget {
  static const String routeName = '/controllerPage';

  static Widget create() {
    return ControllerPage();
  }

  const ControllerPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      drawer: CustomDrawer(),
      extendBody: true,
      body: Navigator(
        key: locator<NavigationService>().navigatorKey,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
