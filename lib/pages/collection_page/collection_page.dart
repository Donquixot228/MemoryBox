import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/pages/add_audio_to_collection_page/add_audio_to_collection_page.dart';
import 'package:memorybox2/resources/resources.dart';
import 'package:memorybox2/services/locator.dart';
import 'package:memorybox2/services/navigation_service.dart';
import 'package:memorybox2/widgets/widgets.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage();

  static const String routeName = '/collectionPage';

  static Widget create() {
    return const CollectionPage();
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
            'assets/images/backgroundVector/PodborkiVector.svg',
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: kToolbarHeight, left: 5),
              child: IconButton(
                onPressed: () {
                  locator<NavigationService>()
                      .navigateTo(AddAudioToCollectionPage.routeName);
                },
                icon: SvgPicture.asset(AppIcons.Add),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: kToolbarHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Подборки",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 36)),
                  Text(
                    "Все в одном месте",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: kToolbarHeight, right: 10),
              child: IconButton(
                onPressed: () {
                  log('asdf');
                },
                icon: const Icon(Icons.more_horiz),
                color: Colors.white,
                iconSize: 35,
              ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(top: kToolbarHeight+100),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: (183 / 240),
                  ),
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  itemCount: 10,
                  itemBuilder: (context, index) => const collectionCard(
                    title: 'Сказка о малыше Кокки',
                    time: '7 аудио  2:30 часа',
                    ImageAsset: 'assets/images/Kokki.png',
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }
}
