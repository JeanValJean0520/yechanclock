import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yechanclock/data/date.dart';
import 'package:yechanclock/data/word_data.dart';
import 'package:yechanclock/ui/lock_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String? videoId = YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=BBAyRBTfsOU");

  var dateData = DateData();
  var wordData = WordData();

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '2pPjM_NraCQ',
    flags: YoutubePlayerFlags(
      autoPlay: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final Stream _timeStreamImprove =
        Stream.periodic(Duration(seconds: 1), (var i) {
      dateData.getNowDateData();
    });

    int randomValue = Random().nextInt(30);

    return StreamBuilder(
      stream: _timeStreamImprove,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: (dateData.nowHour >= 10 && dateData.nowDay == 0) ? Text("고생 많았다") : Text(widget.title),
          ),
          body: Center(
            child: dateData.nowDay != 0
                ? Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        child: Text(
                          wordData.wordData[randomValue],
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "2024 대학수학능력시험 (D-${dateData.nowDay})",
                      ),
                      Text(
                        "${dateData.nowDay - 1}일 ${dateData.nowHour - 1}시간 ${dateData.nowMinute - 1}분 ${dateData.nowSecond}초",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  )
                : dateData.nowHour >= 10
                    ? Center(
              child: Column(
                children: [

                  Text("오메데토"),
                  Text("축하해"),
                  YoutubePlayer(
                    controller: _controller,

                  ),
                  Container(
                    height: 500,
                    width: 300,
                    child: ListView.builder(
                      itemCount: wordData.wordData.length,
                        itemBuilder: (context, idx){
                          return Column(
                            children: [
                              SizedBox(height: 10,),
                              Container(
                                child: Text(wordData.wordData[idx]),
                              ),
                              Container(width: MediaQuery.sizeOf(context).width,height: 0.5,color: Colors.black,)
                            ],
                          );
                        }
                    ),
                  )
                ],
              ),
            )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: Text(
                                  "예찬아 오늘은 너가 그동안의 노력을 성과로 만드는 날이다 운좋게 찍으라는 말은 그동안 너의 노력을 개무시하는 말이라 생각한다 내가 할수있는건 그저 그동안 너가 고생했던 노력들이 합당한 성과를 만들어내기를 바란다. -장현용-",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                )),
                            Container(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: Text(
                                  "예찬아 잘보고와라 밥이나 한끼해야지. -김대우-",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                )),
                          ],
                        ),
                      ),
          ), // T
          floatingActionButton: (dateData.nowHour >= 10 && dateData.nowDay == 0) ? Container() : FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LockPage()));
            },
            child: Icon(Icons.safety_check),
          ), // his trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
