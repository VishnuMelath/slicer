import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/image_composition.dart';
import 'package:slicer/constants/constants.dart';
import 'package:slicer/game/game_data.dart';
import '../game.dart';

class Enemy extends SpriteComponent
    with HasGameRef<TestGame>, CollisionCallbacks {
  final double fallVal;    
  late Image image1;
  late Image image2;
  late Image image3;
  late Image image4;
  late Image image5;
  late Image image6;

  List<Image> images = [];
  int count = 0;
  int image = 1;

  Enemy({required this.fallVal});
  @override
  FutureOr<void> onLoad() async {
    image1 = await Flame.images.load('fire-1.gif');
    image2 = await Flame.images.load('fire-2.gif');
    image3 = await Flame.images.load('fire-3.gif');
    image4 = await Flame.images.load('fire-4.gif');
    image5 = await Flame.images.load('fire-5.gif');
    image6 = await Flame.images.load('fire-6.gif');

    images = [image1, image2, image3, image4, image5, image6];
    sprite = Sprite(image1);
    size = Vector2.all(200);
    position = Vector2(position.x, (-gameRef.size.y / 2) + (size.y / 2));
    anchor = Anchor.center;

    add(PolygonHitbox(
      [ Vector2(100, 50),
      Vector2(40, 150),
      Vector2(70, 170),
      Vector2(170, 170),]
    ));
  }

  @override
  void update(double dt) {
    falling(dt);
    count++;
    if (count == 5) {
      image++;
      count = 0;
      image = image % 6;
    }
    super.update(dt);
    sprite = Sprite(images[image]);
  }

  falling(double dt) {
    double newy = position.y + (fallVal);
    if (newy > (gameRef.size.y) - (size.y / 2)) {
      // newy = -(gameRef.size.y / 2) + (size.y / 2);
      GameData.score.value+=5;
      removeFromParent();
    }
   else {
      position.y = newy;
    }
  }

  double moveHorizontally(double dx) {
    double newx = position.x + dx;
    newx = (newx * DateTime.now().microsecond) % gameWidth;
    newx = newx > (gameWidth / 2)
        ? (newx - (gameWidth / 2) - (size.x))
        : (-(newx) + (size.x));

    return newx;
  }
}
