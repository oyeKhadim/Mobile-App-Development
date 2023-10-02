import 'package:flutter/material.dart';
import 'package:ch7_animation_controller/widgets/animated_balloon.dart';

void main() {
  runApp(MaterialApp(
    title: 'Ballon Animations',
    home: Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                AnimatedBalloonWidget(),
              ],
            ),
          ),
        ),
      ),
    ),
  ));
}
