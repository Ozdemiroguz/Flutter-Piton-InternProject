import 'package:defaultproject/models/models.dart';
import 'package:defaultproject/now_playing/now_playing_page.dart';
import 'package:defaultproject/styles/styles.dart';
import 'package:defaultproject/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget trendingPage(TrendingPage trendingPage, BuildContext context) {
  return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NowPlayingPage()),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(int.parse(trendingPage.backColor)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  trendingPage.backIamge == ""
                      ? //hibirşey yapma
                      Container()
                      : Positioned(
                          top: 21,
                          left: 36,
                          child: Image.asset('assets/Group.png',
                              fit: BoxFit.cover), // Arkadaki resmi belirtir.
                        ),
                  Positioned(
                    right: 11,
                    bottom: 0,
                    child: Image.asset(
                      'assets/${trendingPage.image}',
                      fit: BoxFit.cover,
                    ), // Öndeki resmi belirtir.
                  ),
                ],
              ),
            ),
          ),
          Text(
            "${trendingPage.title}",
            textAlign: TextAlign.left,
            style: trendingPageStyle1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${trendingPage.name}",
                style: trendingPageStyle2,
              ),
            ],
          )
        ],
      ));
}
