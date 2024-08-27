import 'package:flutter/material.dart';
import 'package:slicer/game/game_data.dart';

Widget lifeWidget() {
  return Positioned(
    bottom: 10,
    right: 10,
    child: ValueListenableBuilder(
        valueListenable: GameData.life,
        builder: (context, value, _) {
          List<Widget> lifes = [];
          for (var i = 0; i < value; i++) {
            lifes.add(const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 100,
              ),
            ));
          }
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: lifes,
          );
        }),
  );
}
