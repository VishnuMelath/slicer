

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:slicer/constants/constants.dart';
import 'package:slicer/game/world.dart';

class TestGame extends FlameGame<SlicerWorld> with PanDetector,HasCollisionDetection{
  TestGame()
      : super(
        world: SlicerWorld(),
          camera: CameraComponent.withFixedResolution(
              width: gameWidth, height: gameHeight),
        );
 

  @override
  Color backgroundColor() {
    return  Colors.transparent;
  }
   

  @override
  void onPanUpdate(DragUpdateInfo info) {

    super.onPanUpdate(info);
    world.player.move(info.delta.global.x, info.delta.global.y);
  }
}
