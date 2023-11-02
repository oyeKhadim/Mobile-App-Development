import 'package:flutter/material.dart';
import 'package:quiz_2/widgets/menu_list_tile.dart';
class RightDrawerWidget extends StatefulWidget {
  const RightDrawerWidget({super.key});

  @override
  State<RightDrawerWidget> createState() => _RightDrawerWidgetState();
}

class _RightDrawerWidgetState extends State<RightDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.face,
              size: 128.0,
              color: Colors.white54,
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          const MenuListTileWidget(),
        ],
      ),
    );
  }
}
