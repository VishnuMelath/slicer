import 'package:flutter/material.dart';
import 'package:slicer/methods/date_time.dart';
import 'package:slicer/models/scoremodel.dart';
import 'package:slicer/style/style.dart';

Widget scoreTile(GameScoreModel score,int index)
{

  List<Color> colors=[Colors.yellow[700]!,Colors.grey[400]!,Colors.brown[300]!];
  return Container(
    margin: const EdgeInsets.all(10),
    decoration: tileDecoration,
    child:  ListTile(
            leading: CircleAvatar(
              radius: 15,
              backgroundColor: index<3?colors[index]:Colors.transparent,
              child: Visibility(
                visible: index<3,
                child: Text('${index+1}' ,style: whiteNormalTextStyle,),
              ),
            ),
            title: Text("Score ${score.score.toString()}",style: whiteNormalTextStyle,),
            subtitle: Text(dateString(score.date),style: whiteSmallTextStyle,),
           ),
  );
}