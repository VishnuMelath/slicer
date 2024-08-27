import 'package:flutter/material.dart';
import 'package:slicer/style/style.dart';

Widget customButton(BuildContext context,String label,void Function()? onTap,{double? width,double? height})
{
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Container(
          padding:const EdgeInsets.symmetric(horizontal: 10),
          decoration: buttonDecoration,
          width:width!=null?null: MediaQuery.sizeOf(context).width*0.6,
          height: 50,
          child: Center(child: Text(
            label,
            style: buttonTextStylel,
          ),),
        ),
      ),
    ),
  );
}