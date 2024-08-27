import 'package:flutter/painting.dart';
import 'package:slicer/style/colors.dart';

BoxDecoration buttonDecoration=BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(colors: [blue,black])
);
BoxDecoration tileDecoration=BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(colors: [black,white,])
);
TextStyle buttonTextStylel =TextStyle(color: white,fontSize: 19,fontWeight:FontWeight.w800,);

TextStyle whiteNormalTextStyle =TextStyle(color: white,fontSize: 15,fontWeight: FontWeight.w700);

TextStyle whiteSmallTextStyle =TextStyle(color: white,fontSize: 11,fontWeight: FontWeight.w700);
