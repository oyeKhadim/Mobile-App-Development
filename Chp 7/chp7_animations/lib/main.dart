import 'package:flutter/material.dart';
import 'package:chp7_animations/widgets/animated_container.dart';
import 'package:chp7_animations/widgets/animated_cross_fade.dart';
import 'package:chp7_animations/widgets/animated_opacity.dart';
void main() {
  runApp(MaterialApp(
    title: 'Animations',
    home: Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AnimatedContainerWidget(),
            Divider(),
            AnimatedCrossFadeWidget(),
            Divider(),
            AnimatedOpacityWidget(),
          ],
        ),
      ),
    ),
  ));
}
