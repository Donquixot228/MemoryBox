
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/resources/resources.dart';
import 'package:memorybox2/widgets/search_field.dart';

class AddAudioToCollectionPage extends StatelessWidget {
  const AddAudioToCollectionPage();

  static const String routeName = '/addAudioToCollectionPage';

  static Widget create() {
    return  const AddAudioToCollectionPage();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.whiteColor,
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/backgroundVector/PodborkiVector.svg',
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 57,
            left: 5,
            child: Container(
              margin: const EdgeInsets.only(left: 9, top: 9),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: IconButton(
                onPressed: () {
            ///////////////////////////////////////////      setIndex(1);
                },
                icon: SvgPicture.asset(AppIcons.Back_Arrow_Collection),
              ),
            ),
          ),
          Positioned(
            top: 67,
            right: 103,
            child: Text("Выбрать",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 36)),
          ),
          searchField(),
        ],
      ),
    );
  }
}
