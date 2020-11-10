import 'package:flutter/material.dart';
import 'package:reviewbhai_app/pages/home.dart';
import 'package:reviewbhai_app/pages/login.dart';

void main() {
  runApp(MaterialApp(

    routes: {
      '/': (context) => Login(),
    },
  ));
}

