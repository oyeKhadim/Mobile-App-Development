import 'package:flutter/material.dart';
import 'package:chap9_stack/widgets/stack.dart';
import 'package:chap9_stack/widgets/stack_favorite.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('top app bar'),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              if (index.isEven) {
                return const StackWidget();
              } else {
                return const StackFavoriteWidget();
              }
            },
          ),
        ));
  }
}
