import 'package:flutter/material.dart';
import 'package:incubator_v2/screens/homepage.dart';
import 'package:incubator_v2/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Incubator', theme: CustomTheme.darkTheme, home: Homepage());
  }
}
