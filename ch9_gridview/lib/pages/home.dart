import 'package:flutter/material.dart';
import 'package:ch9_gridview/widgets/gridview_builder.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  GridViewBuilderWidget(),
      ),
    );
  }
}
