import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slicer/game/gameapp.dart';
import 'package:slicer/scores.dart';
import 'package:slicer/widgets/custom_button.dart';

class GameMenu extends StatelessWidget {
  const GameMenu({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column( 
        mainAxisSize: MainAxisSize.min,
        
        children: [ 
          customButton(context,'play', () {
            Navigator.push(context, MaterialPageRoute(builder:(context) =>const GameApp(), ));
          },),customButton(context,'highscores', () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>const ScoresPage(),));
          },),customButton(context,'exit', () {
            SystemNavigator.pop();
          },),
        ],
      ),
    );
  }
}