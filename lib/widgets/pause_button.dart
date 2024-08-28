import 'package:flutter/material.dart';
import 'package:slicer/game/game.dart';
import 'package:slicer/game/game_data.dart';

Widget pauseButton(BuildContext context,TestGame game)
{
  bool paused=false;
  return Positioned(
    right: 20,
    child: IconButton(onPressed: () {
      if (!paused) {
        GameData.pauseMenu.value=!GameData.pauseMenu.value;
    game.pauseEngine();
    paused=!paused;
    }
    else
    {
       GameData.pauseMenu.value=!GameData.pauseMenu.value;
    game.resumeEngine();
    paused=!paused;
    }
    }, icon:const Icon(Icons.pause,size: 80,)),
  );
}