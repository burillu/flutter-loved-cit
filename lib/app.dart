import 'package:flutter/material.dart';
import 'package:loved_cit/pages/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: HomePage(),
    );
  }
}
