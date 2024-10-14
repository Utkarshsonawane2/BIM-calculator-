import 'package:bimdemo/views/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const bimDemo());
}

class bimDemo extends StatelessWidget {
  const bimDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: inputPage(),
    );
  }
}
