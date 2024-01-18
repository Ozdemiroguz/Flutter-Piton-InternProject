import 'package:defaultproject/getting_started/getting_started_widget.dart';
import 'package:defaultproject/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:defaultproject/explore/explore_page.dart';

class GettingStartedPage extends StatefulWidget {
  const GettingStartedPage({super.key});

  @override
  State<GettingStartedPage> createState() => _GettingStartedPageState();
}

class _GettingStartedPageState extends State<GettingStartedPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil.getScreenWidthPercentage(context, 1);
    double screenHeight = ScreenUtil.getScreenHeightPercentage(context, 1);
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: screenWidth,
              height: screenHeight * 0.6,
              child: PageView.builder(
                itemCount: 3,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return MainHero();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                3,
                (index) => CustomDot(index: index, currentPage: _currentPage),
              ),
            ),
            SizedBox(height: screenHeight * 0.12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF525298),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExplorePage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 70,
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF1F1D2B),
                      size: 32,
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
