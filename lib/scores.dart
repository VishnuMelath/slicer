
import 'package:flutter/material.dart';
import 'package:slicer/database/score_db_services.dart';
import 'package:slicer/style/colors.dart';
import 'package:slicer/widgets/score_tile.dart';

class ScoresPage extends StatelessWidget {
  const ScoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: ValueListenableBuilder(valueListenable: scoreNotifier, builder: (context, value, child) {
       return ListView.builder(
        itemCount: value.length,
        itemBuilder: (context, index) {
         return scoreTile(value[index], index);
       },); 
      },),
    );
  }
} 