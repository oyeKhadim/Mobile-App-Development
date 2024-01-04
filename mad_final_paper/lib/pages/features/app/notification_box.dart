

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void messageToShow(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 3,
    backgroundColor: Color(0xFFFF5733),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
