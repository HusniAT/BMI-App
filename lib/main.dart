import 'package:flutter/material.dart';

import 'Home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        textTheme: const TextTheme(
          headline2:
          TextStyle(fontSize: 45,
              fontWeight: FontWeight.w800,
            color: Colors.white
          ),
          headline3:
          TextStyle(fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
          bodyText1:
          TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),



        ),
        iconTheme:const IconThemeData(
          color: Colors.white,size: 80
        )
      ),
      home:  MyHomePage(),
    );
  }
}
