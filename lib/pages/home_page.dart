// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            sectionCit(),
            // sectionSavedList()
          ],
        ),
      ),
    );
  }

  Widget sectionCit() => SliverToBoxAdapter(
          child: Stack(children: [
        Container(
          height: 650,
          padding: EdgeInsets.all(20),
          color: Colors.red,
          child: Column(
            children: [
              Text(
                "Citation mega ultra filosofica strappalacrime",
                style: TextStyle(fontSize: 28, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ]));
}
