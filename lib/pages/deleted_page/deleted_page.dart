
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memorybox2/widgets/widgets.dart';



class DeletedPage extends StatelessWidget {
 const DeletedPage();

  static const String routeName = '/deleted';

  static Widget create() {
    return  DeletedPage();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            SvgPicture.asset(
              'assets/images/backgroundVector/SearchVector.svg',
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 57,
              left: 5,
              child: appBarLending,
            ),
            Positioned(
              top: 57,
              right: 100,
              child: Text(
                "  Недавно удаленные",
                style: TextStyle(
                  fontFamily: 'TTNorms-Bold',
                  fontSize: 36,
                  letterSpacing: 0.6,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 57,
              right: 16,
              child: IconButton(
                onPressed: (){
                  log('asdf');
                },
                icon: Icon(Icons.more_horiz),
                color: Colors.white,
                iconSize: 35,
              ),
            ),

            Positioned(
              top: 250,
              left: 25,
              child: Container(
                width: 350,
                height: 600,
              ),
            ),
          ],

      );
  }
}