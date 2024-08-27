import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:slicer/home.dart';
import 'package:slicer/models/scoremodel.dart';

void main() async{
   await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(GameScoreModelAdapter());
  Flame.device.fullScreen();
  Flame.device.setPortrait();
  runApp(const Home());
}
