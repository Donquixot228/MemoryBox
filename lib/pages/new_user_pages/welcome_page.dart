import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/widgets/widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage();
  static const String routeName = '/welcomePage';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WelcomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        color: const Color(0xFFF6F6F6),
        child:  Stack(
          children: [
           SvgPicture.asset(
              'assets/images/backgroundVector/Vector.svg',
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Container(
                  height: 330,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'MemoryBox',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          'Твой голос всегда рядом',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Привет!',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Text(
                        'Мы рады видеть тебя здесь. Это '
                        'приложение поможет записывать сказки и держать их в '
                        'удобном месте не заполняя память на телефоне',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      continue_Button(
                        isPhone: false,
                        isPin: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
