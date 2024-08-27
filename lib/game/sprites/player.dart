import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:slicer/game/game.dart';
import 'package:slicer/game/game_data.dart';
import 'package:slicer/game/sprites/enemy.dart';
import 'package:slicer/widgets/game_over_widget.dart';

class Player extends SpriteComponent
    with HasGameRef<TestGame>, CollisionCallbacks {
  late Image image1;
  late Image image2;
  late Image image3;
  late Image image4;
  late Image image5;
  late Image image6;
  late Image image7;
  late Image image8;
  late RectangleHitbox hitbox =
      RectangleHitbox(size: Vector2.all(100), position: Vector2(50, 50));
  List<Image> images = [];
  int count = 0;
  int image = 1;
  @override
  FutureOr<void> onLoad() async {
    image1 = await Flame.images.load('5GpK-1.png');
    image2 = await Flame.images.load('5GpK-2.png');
    image3 = await Flame.images.load('5GpK-3.png');
    image4 = await Flame.images.load('5GpK-4.png');
    image5 = await Flame.images.load('5GpK-5.png');
    image6 = await Flame.images.load('5GpK-6.png');
    image7 = await Flame.images.load('5GpK-7.png');
    image8 = await Flame.images.load('5GpK-0.png');
    images = [image1, image2, image3, image4, image5, image6, image7, image8];
    sprite = Sprite(image1);
    size = Vector2.all(200);
    position = Vector2(0, (gameRef.size.y / 2) - (size.y / 2));
    anchor = Anchor.center;
    add(PolygonHitbox([
      Vector2(70, 50),
      Vector2(120, 52),
      Vector2(150, 150),
      Vector2(50, 150),
    ]));
  }

  void move(double dx, double dy) {
    count++;
    if (count > 5) {
      count = 0;
      image = (image + 1) % 8;
      sprite = Sprite(images[image]);
    }

    moveHorizontally(dx / 1.3);
    moveVertically(dy / 1.3);
  }

  void moveHorizontally(double dx) {
    double newx = position.x + (dx * 1.3);
    double minx = -(gameRef.size.x / 2) + size.x / 2;
    double maxx = (gameRef.size.x / 2) - size.x / 2;
    newx = newx.clamp(minx, maxx);
    position.x = newx;
  }

  void moveVertically(double dy) {
    double newy = position.y + dy;
    double miny = -(gameRef.size.y / 2) + size.y / 2;
    double maxy = (gameRef.size.y / 2) - size.y / 2;
    newy = newy.clamp(miny, maxy);
    position.y = newy;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Enemy) {
      GameData.life.value--;
      if (GameData.life.value == 0) {
        game.pauseEngine();
        gameOverNotifier.value = true;
      }
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}
