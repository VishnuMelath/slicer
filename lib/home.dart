import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slicer/style/colors.dart';
import 'package:slicer/widgets/menu.dart';

import 'database/score_db_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
        ScoreDbServices().getAllScores();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
     
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
         appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
      ),
      home:  Container(
        color: blue,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: blue,
            body: const GameMenu(),
          ),
        ),
      ),
    );
  }
}