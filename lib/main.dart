import 'package:flutter/material.dart';
import 'package:news_app/news_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News App",
      theme: ThemeData(
        primaryColor: Colors.white,
        //primarySwatch: Colors.white
      ),
      home: NewsApp(),

    );
  }

}

