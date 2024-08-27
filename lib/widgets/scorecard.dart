import 'package:flutter/widgets.dart';
import 'package:slicer/game/game_data.dart';
import 'package:slicer/style/colors.dart';
import 'package:slicer/style/style.dart';

Widget scoreCard() {
  return Positioned(
    left: 10,
    top: 0,
    child: Container(
      decoration: buttonDecoration,
      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
      child: ValueListenableBuilder(
        valueListenable: GameData.score,
        builder: (context, value, child) {
          return Text(
            'score : $value',
            style: TextStyle( 
              color: white,
              fontSize: 40
            ),
          );
        },
      ),
    ),
  );
}
