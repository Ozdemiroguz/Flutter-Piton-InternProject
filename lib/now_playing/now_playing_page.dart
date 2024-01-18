//now playing page

import 'dart:html';

import 'package:defaultproject/explore/explore_page_widget.dart';
import 'package:defaultproject/models/models.dart';
import 'package:defaultproject/now_playing/now_playing_widgets.dart';
import 'package:defaultproject/styles/styles.dart';
import 'package:defaultproject/utils/screen_util.dart';
import 'package:flutter/material.dart';

class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({Key? key}) : super(key: key);
  @override
  _NowPlayingPageState createState() => _NowPlayingPageState();
}

TrendingPage trendingPage1 = TrendingPage(
  title: 'The missing 96 percent of the universe',
  name: 'Claire Malone',
  image: 'trendpageassets11.png',
  backIamge: "",
  backColor: "0xFFB548C6",
);

class _NowPlayingPageState extends State<NowPlayingPage> {
  @override
  List<int>? soundWaweData = [
    12,
    20,
    24,
    35,
    28,
    24,
    35,
    22,
    35,
    14,
    17,
    9,
    17,
    35,
    18,
    31,
    14,
    17,
    20,
    11,
    18,
    23,
    35,
    29,
    23,
    35,
    22,
    23,
    11
  ];

  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil.getScreenWidthPercentage(context, 1);
    double screenHeight = ScreenUtil.getScreenHeightPercentage(context, 1);
    return Scaffold(
        appBar: //,
            AppBar(
          toolbarHeight: screenHeight * 0.12,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left_outlined,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Now Playing',
            style: nowPlayingTitle,
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              trendContainer(trendingPage1),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: Text(trendingPage1.title, style: trendingPage3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      trendingPage1.name,
                      style: trendingPage4,
                    ),
                  ),
                ],
              ),
              soundWawe(soundWaweData!, 15, screenWidth),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '24:32',
                      style: timeStyle,
                    ),
                    Text(
                      '34:00',
                      style: timeStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF2F3142),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        width: 56,
                        height: 56,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
