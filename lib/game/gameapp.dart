
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:slicer/constants/constants.dart';
import 'package:slicer/game/game.dart';
import 'package:slicer/widgets/game_over_widget.dart';
import 'package:slicer/widgets/life.dart';
import 'package:slicer/widgets/pause_button.dart';
import 'package:slicer/widgets/pause_menu.dart';
import 'package:slicer/widgets/scorecard.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late TestGame game;
  @override
  void initState() {

    game = TestGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/background.jpg'))),
      child: SafeArea(
        child: PopScope(
         canPop: false,
         
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: FittedBox(
                child: SizedBox(
                    width: gameWidth,
                    height: gameHeight,
                    child: Stack(
                      children: [
                        GameWidget( game: game),
                         gameOverWidget(context),
                         pauseButton(context, game),
                         lifeWidget(),
                         scoreCard(),
                         pauseMenu(context, game)
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
