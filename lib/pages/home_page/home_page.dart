import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/cubits/navigation_index_cubit/navigation_index_cubit.dart';
import 'package:memorybox2/pages/home_page/widgets/blue_home_card.dart';
import 'package:memorybox2/pages/home_page/widgets/green_home_card.dart';
import 'package:memorybox2/pages/home_page/widgets/orange_home_card.dart';
import 'package:memorybox2/repositories/database_repository/database_repository.dart';
import 'package:memorybox2/resources/resources.dart';
import 'package:memorybox2/widgets/widgets.dart';

import 'package:provider/src/provider.dart';

class HomePage extends StatelessWidget {


  const HomePage();

  static const String routeName = '/homePage';

  static Widget create() {
    return  HomePage();
  }

  final allText = const [
    Text('sda', style: TextStyle(fontSize: 10, color: Colors.black26)),
    Text('sda', style: TextStyle(fontSize: 10, color: Colors.black26)),
    Text('sda', style: TextStyle(fontSize: 10, color: Colors.black26)),
    Text('sda', style: TextStyle(fontSize: 10, color: Colors.black26)),
    Text('sda', style: TextStyle(fontSize: 10, color: Colors.black26)),
    Text('sda', style: TextStyle(fontSize: 10, color: Colors.black26)),
    Text('sda', style: TextStyle(fontSize: 10, color: Colors.black26)),
    Text('sda', style: TextStyle(fontSize: 10, color: Colors.black26)),
    Text('sda', style: TextStyle(fontSize: 10, color: Colors.black26)),
    Text('sda', style: TextStyle(fontSize: 10, color: Colors.black26)),
    Text('sda'),
    Text('sda'),
    Text('sda'),
    Text('sda'),
    Text('sda'),
    Text('sda'),
    Text('sda'),
    Text('sda'),
    Text('sda'),
    Text('sda'),
  ];

  @override
  Widget build(BuildContext context) {
    List<Text> texs = allText;

    return Container(
      height: MediaQuery.of(context).size.height,
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
            height: 255,
            right: 11,
            left: 17,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Подборки',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: AppColors.whiteColor),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    context
                        .read<NavigationIndexCubit>()
                        .state
                        .copyWith(currentIndex: 1);
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    alignment: Alignment.bottomRight,
                  ),
                  child: Text(
                    'Открыть все',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
          ),
           greenHomeCard(),
          Positioned(
            top: 166,
            right: 16,
            left: 215,
            child: Column(
              children: [
                orangeHomeCard(),
                SizedBox(height: 16),
                blueHomeCard(),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            maxChildSize: 0.5,
            builder: (context, controller) => Container(
              margin: EdgeInsets.only(left: 7, right: 7),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: controller,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Аудиозаписи",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            BlocBuilder<DataBaseRepository, UserModel>(
                              builder: (context, state) {
                                return InkWell(
                                  onTap: () async {
                                    await context
                                        .read<DataBaseRepository>()
                                        .getUserInfoFromFB()
                                        .then((value) => print(state
                                            .toString()));
                                  //  setIndex(3);
                                  },
                                  child: Text(
                                    'Открыть все',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            color: const Color(0xFF3A3A55)),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 100,
                          height: 300,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: texs.length,
                              controller: controller,
                              itemBuilder: (context, index) {
                                final text = texs[index];
                                return text;
                              }),
                        ),
                      ],
                    ),
                  )
                  //
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
