import 'package:flutter/material.dart';
import 'package:slicer/constants/constants.dart';
import 'package:slicer/game/game_data.dart';
import 'package:slicer/game/gameapp.dart';
import 'package:slicer/home.dart';
import 'package:slicer/style/colors.dart';
import 'package:slicer/widgets/custom_button.dart';

import '../game/game.dart';

Widget pauseMenu(BuildContext context,TestGame game) {
  return ValueListenableBuilder(
    valueListenable: GameData.pauseMenu,
    builder: (context, value, child) {
      return Visibility(
        visible: value,
        child: Container(
          width: gameWidth,
          height: gameHeight,
          color: blue.withOpacity(0.8),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                customButton(
                  context,
                  'Resume',
                  () {
                    
                    game.resumeEngine();
                    GameData.pauseMenu.value = false;
                  },
                ),
                customButton(
                  context,
                  'Restart',
                  () {GameData.pauseMenu.value = false;
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GameApp(),
                        ));
                  },
                ),
                customButton(
                  context,
                  'Exit',
                  () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
