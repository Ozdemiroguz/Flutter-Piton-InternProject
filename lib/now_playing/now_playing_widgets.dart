import 'package:defaultproject/models/models.dart';
import 'package:flutter/material.dart';

Widget trendContainer(TrendingPage trendingPage) {
  return Container(
    height: 280,
    decoration: BoxDecoration(
      color: Color(int.parse(trendingPage.backColor)),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Stack(
      //center
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
          bottom: 0,

          // Burada Container widgetını ekledik
          // Yüksekliği ayarla

          child: Image.asset(
            'assets/${trendingPage.image}',
            fit: BoxFit.fill,
          ), // Öndeki resmi belirtir.
        ),
      ],
    ),
  );
}

Widget soundWawe(
  List<int> soundWawe,
  int curentTime,
  double screenWidth,
) {
  return Padding(
    padding: const EdgeInsets.only(top: 24),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          soundWawe.length,
          (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 1),
                height: soundWawe[index].toDouble(),
                width: screenWidth < 375 ? 4 : 8,
                decoration: BoxDecoration(
                  color: index < curentTime ? Colors.white : Color(0x40FFFFFF),
                  borderRadius: BorderRadius.circular(5),
                ),
              )),
    ),
  );
}
