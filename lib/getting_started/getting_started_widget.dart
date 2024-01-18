import 'package:flutter/material.dart';
import 'package:defaultproject/utils/screen_util.dart';

class CustomDot extends StatelessWidget {
  final int index;
  final int currentPage;

  CustomDot({required this.index, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xFF525298) : Color(0xFF7B8085),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class MainHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = ScreenUtil.getScreenWidthPercentage(context, 1);
    final double screenHeight =
        ScreenUtil.getScreenHeightPercentage(context, 1);
    return Center(
      child: Column(
        children: [
          Container(
            width: 240,
            height: 317,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(
                      'assets/good-faces-AHoHjNqME4Q-unsplash 1.png')),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
              ),
            ),
          ),
          Text(
            'Podkes',
            style: TextStyle(
              fontSize: 36.0,
              height: 1.6,
              fontFamily: 'popins',
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 0.3,
            ),
          ),
          Text(
            "A podcast is an episodic series of spoken word digital audio files that a user can download to a personal device for easy listening.",
            style: TextStyle(
              fontSize: 13,
              height: 1.6,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: Color(0xFFC4C4C4),
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
