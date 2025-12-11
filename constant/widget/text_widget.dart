import 'package:flutter/material.dart';

Widget robotoText(text, color, double size, {align,textoverflow,textline = TextDecoration.none,maxline=1}) => Text(
      text,
      textAlign: align,
      maxLines:maxline ,
       overflow: textoverflow,
      style: TextStyle(
       decoration: textline,
       decorationColor: color,
          fontFamily: "Roboto",
          fontSize: size,
          fontWeight: FontWeight.w400,
          color: color),
    );



Widget robotoboldText(text, color, double size, {align,textoverflow,textline = TextDecoration.none,maxline=1}) => Text(
      text,
      textAlign: align,
      maxLines:maxline ,
       overflow: textoverflow,
      style: TextStyle(
       decoration: textline,
       decorationColor: color,
          fontFamily: "Roboto",
          fontSize: size,
          fontWeight: FontWeight.w600,
          color: color),
    );

Widget kronaText(text, color, double size, {align,textoverflow,textline = TextDecoration.none,maxline=1}) => Text(
      text,
      textAlign: align,
       overflow: textoverflow,
          maxLines:maxline ,
          
      style: TextStyle(
       decoration: textline,
       decorationColor: color,
          fontFamily: "Krona one",
          fontSize: size,
          fontWeight: FontWeight.w400,
          color: color),
    );
