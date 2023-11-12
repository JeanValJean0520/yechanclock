import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yechanclock/image_data.dart';

class LockPage extends StatefulWidget {
  const LockPage({super.key});

  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {

  var imageData = ImageData();

  int hour = 0;
  int minute = 0;
  int second = 0;

  @override
  Widget build(BuildContext context) {
    int randomValue = Random().nextInt(12);

    final Stream _timeStreamImprove =
        Stream.periodic(Duration(seconds: 1), (var i) {
      second++;
      if (second >= 60) {
        minute++;
        second = 0;
      }
      if (minute >= 60) {
        hour++;
        minute = 0;
        second = 0;
      }
    });

    return StreamBuilder(
      stream: _timeStreamImprove,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("집중시간"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child:Image.asset(imageData.imageData[randomValue],fit: BoxFit.cover,)
                ),
                Text(
                  "$hour 시간 $minute 분 $second 초",
                  style: TextStyle(fontSize: 36),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
