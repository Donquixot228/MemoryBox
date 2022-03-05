
import 'package:flutter/material.dart';


Widget greenHomeCard () {
    return Positioned(
      top: 165,
      left: 16,
      right: 199,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xCD71A59F),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 10),
          ],
        ),
        width: 183,
        height: 220,
        child: Column(
          children: [
            SizedBox(height: 60),
            Text(
              'Здесь будет  твой набор  сказок',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "TTNorms-Medium",
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: (){},
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Text(
                  'Добавить',
                  style: TextStyle(
                    fontFamily: 'TTNorms-Medium',
                    fontSize: 14,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

