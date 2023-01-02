import 'package:age_calculator/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AgeCalculator());
}

class AgeCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blueAccent,
          primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).primaryColor,
          title: Center(
            child: Text(
              "Age Calculator",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: HomeScreen(),
        backgroundColor: Colors.white38,
      ),
    );
  }
}
