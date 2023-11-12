import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yechanclock/date.dart';
import 'package:yechanclock/lock_page.dart';
import 'package:yechanclock/word_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '예찬이를 위한 수능 타이머'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var dateData = DateData();
  var wordData = WordData();


  @override
  Widget build(BuildContext context) {
    final Stream _timeStreamImprove =
    Stream.periodic(Duration(seconds: 1), (var i) {
      dateData.getNowDateData();
    });

    int randomValue = Random().nextInt(30);

    return StreamBuilder(
      stream: _timeStreamImprove,
      builder: (context, snapshot){
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  child: Text(
                    wordData.wordData[randomValue],
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(height: 30,),
                Text("2024 대학수학능력시험 (D-${dateData.nowDay})",),
                Text(
                  "${dateData.nowDay -1}일 ${dateData.nowHour}시간 ${dateData.nowMinute}분 ${dateData.nowSecond}초",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ), // T
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => LockPage()));
            },
            child: Icon(Icons.safety_check),
          ),// his trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
