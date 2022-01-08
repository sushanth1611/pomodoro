// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pomodora/screens/welcome_screen.dart';

void main() => runApp(Pomodoro());

class Pomodoro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
