import 'package:flutter/material.dart';
import 'package:chap9_customscrollview_slivers/widgets/sliver_app_bar.dart';
import 'package:chap9_customscrollview_slivers/widgets/sliver_list.dart';
import 'package:chap9_customscrollview_slivers/widgets/sliver_grid.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Custom Scroll View - Slivers'),
          elevation: 0.0,
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBarWidget(),
            const SliverListWidget(),
            const SliverGridWidget(),
          ],
        ));
  }
}
