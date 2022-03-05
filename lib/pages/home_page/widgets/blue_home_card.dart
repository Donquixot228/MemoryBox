
import 'package:flutter/material.dart';

Widget blueHomeCard(){
    return Container(
      decoration: BoxDecoration(
        color: Color(0xCB678BD2),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10),
        ],
      ),
      width: 183,
      height: 100,
      alignment: Alignment.center,
      child: Text(
        'И тут',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: "TTNorms-Medium",
        ),
      ),
    );
  }
