// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:slicer/database/score_db_services.dart';
import 'package:slicer/game/game_data.dart';
import 'package:slicer/game/gameapp.dart';
import 'package:slicer/home.dart';
import 'package:slicer/models/scoremodel.dart';
import 'package:slicer/widgets/custom_button.dart';

ValueNotifier<bool> gameOverNotifier = ValueNotifier(false);

Widget gameOverWidget(BuildContext context) {
  gameOverNotifier.value = false;
  return ValueListenableBuilder(
    valueListenable: gameOverNotifier,
    builder: (context, value, child) {
      log(value.toString());
      return Visibility(
          visible: value,
          child: Center(
            child: AlertDialog(
              title: const Text(
                'Game over',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: GameData.score.value>scoreNotifier.value.first.score,
                    child: const Text('New high score')),
                  Text(
                    'Score ${GameData.score.value.toString()}',
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              actions: [
                customButton(
                  context,
                  'play again',
                  () async {
                    await saveScore().then(
                      (value) {
                        GameData.reset();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GameApp(),
                            ));
                        
                      },
                    );
                  },
                ),
                customButton(
                  context,
                  'Exit',
                  () async {
                    await saveScore().then(
                      (value) {
                        GameData.score.value = 0;
                        GameData.life.value = 3;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ));
                      },
                    );
                  },
                )
              ],
            ),
          ));
    },
  );
}

Future saveScore() async {
  final score =
      GameScoreModel(score: GameData.score.value, date: DateTime.now());
  await ScoreDbServices().save(score);
}
