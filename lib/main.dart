import 'package:flutter/material.dart';
import 'package:flutter_provider/src/home.dart';
import 'package:flutter_provider/src/provider/bottom_navigation_provider.dart';
import 'package:flutter_provider/src/provider/count_provider.dart';
import 'package:flutter_provider/src/provider/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        // ChangeNotifierProvider : single provider
        // MultiProvider : 여러개
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) => CountProvider()),
          ChangeNotifierProvider(create: (BuildContext context) => BottomNavigationProvider()),
          ChangeNotifierProvider(create: (BuildContext context) => MovieProvider()),
        ],
        child: Home(),
      ),
    );
  }
}