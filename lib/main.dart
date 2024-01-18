import 'package:defaultproject/explore/explore_page.dart';
import 'package:defaultproject/now_playing/now_playing_page.dart';
import 'package:flutter/material.dart';
import 'getting_started/getting_started_page.dart';
import 'now_playing/now_playing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff1F1D2B),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GettingStartedPage(),
    );
  }
}
