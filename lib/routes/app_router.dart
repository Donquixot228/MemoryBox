import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:memorybox2/pages/pages.dart';


class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    log('This is route : ${settings.name}');
    switch (settings.name) {
      case DeletedPage.routeName:
        return _FadeRoute(child: DeletedPage.create(), time: 0);
      case PermanentUserSplash.routeName:
        return  PermanentUserSplash.route();
      case AfterPinSplash.routeName:
        return AfterPinSplash.route();
      case WelcomePage.routeName:
        return WelcomePage.route();
      case PhoneEnterPage.routeName:
        return PhoneEnterPage.route();
      case PinEnterPage.routeName:
        return PinEnterPage.route();
      case HomePage.routeName:
        return _FadeRoute(child:HomePage.create(), time: 0);
      case AudioListPage.routeName:
        return _FadeRoute(child:AudioListPage.create(), time: 0);
      case SearchPage.routeName:
        return _FadeRoute(child:SearchPage.create(), time: 0);
      case ProfilePage.routeName:
        return _FadeRoute(child:ProfilePage.create(), time: 0);
      case RecordPage.routeName:
        return _FadeRoute(child:RecordPage.create(), time: 0);
      case CollectionPage.routeName:
        return _FadeRoute(child:CollectionPage.create(), time: 0);
      case SubscribePage.routeName:
        return _FadeRoute(child:SubscribePage.create(), time: 0);
      case ControllerPage.routeName:
        return _FadeRoute(child: ControllerPage.create(), time: 0);
      case CreateCollectionPage.routeName:
        return _FadeRoute(child:CreateCollectionPage.create(), time: 0);
      case AddAudioToCollectionPage.routeName:
        return _FadeRoute(child:CreateCollectionPage.create(), time: 0);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
      ),
    );
  }
}
class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final int time;

  _FadeRoute({
    required this.child,
    required this.time,
  }) : super(
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          ) =>
      child,
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
          ) =>
          FadeTransition(
            opacity: animation,
            child: child,
          ),
      transitionDuration: Duration(milliseconds: time));
}
