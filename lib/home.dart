import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slicer/style/colors.dart';
import 'package:slicer/widgets/menu.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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