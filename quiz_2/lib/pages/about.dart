import 'package:flutter/material.dart';
import 'package:quiz_2/widgets/header.dart';
import 'package:quiz_2/widgets/row_with_card.dart';
import 'package:quiz_2/widgets/row.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.shortestSide / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SafeArea(
        child: Hero(
          tag: 'format_paint',
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return HeaderWidget(
                  key: UniqueKey(),
                );
              } else if (index >= 1 && index <= 3) {
                return RowWithCardWidget(key: UniqueKey(), index: index);
              } else {
                return RowWidget(key: UniqueKey(), index: index);
              }
            },
          ),
        ),
      ),
    );
  }
}
