import 'package:flutter/material.dart';
import 'package:ch9_listview/widgets/header.dart';
import 'package:ch9_listview/widgets/row_with_card.dart';
import 'package:ch9_listview/widgets/row.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return HeaderWidget(key: UniqueKey());
            } else if (index >= 1 && index <= 3) {
              return RowWithCardWidget(key: UniqueKey(), index: index);
            } else {
              return RowWidget(key: UniqueKey(), index: index);
            }
          },
        ),
      ),
    );
  }
}
