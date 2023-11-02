import 'package:flutter/material.dart';
import 'birthdays.dart';
import 'gratitude.dart';
import 'reminders.dart';
import 'about.dart';
import '../widgets/left_drawer.dart';
import '../widgets/right_drawer.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_tabChanged);
  }

  @override
  void dispose() {
    super.dispose();

    @override
    void dispose() {
      _tabController.dispose();
      super.dispose();
    }

    _tabController.dispose();
  }

  void _tabChanged() {
    // Check if Tab Controller index is changing, otherwise we get the notice twice
    if (_tabController.indexIsChanging) {
      print('tabChanged: ${_tabController.index}');
    }
  }

  void _openPageAbout(
      {required BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => About(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => _openPageAbout(
              context: context,
              fullscreenDialog: true,
            ),
          ),
        ],
      ),
      drawer: const LeftDrawerWidget(),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            Birthdays(),
            Gratitude(),
            Reminders(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.cake),
              text: 'Birthdays',
            ),
            Tab(
              icon: Icon(Icons.sentiment_satisfied),
              text: 'Gratitude',
            ),
            Tab(
              icon: Icon(Icons.access_alarm),
              text: 'Reminders',
            )
          ],
          controller: _tabController,
          labelColor: Colors.black54,
          unselectedLabelColor: Colors.black38,
        ),
      ),
    );

  }
}
