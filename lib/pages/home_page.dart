import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Color> colors = [
    Color(0xFF66ffbe),
    Color(0xFFfff267),
    Color(0xFFffb968),
    Color(0xFF80e0ff),
    Color(0xFF9980ff),
    Color(0xFFd680ff),
    Color(0xFFff7fb5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [sectionCit(), sectionSavedList()],
        ),
      ),
    );
  }

  Widget sectionCit() => SliverToBoxAdapter(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Center(
              child: AutoSizeText(
                "Citation mega ultra filosofica strappalacrime",
                style: TextStyle(
                    fontSize: 35,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
                maxLines: 7,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.replay,
                    color: Colors.grey[300],
                    size: 50,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline,
                    color: Colors.red[300],
                    size: 50,
                  ),
                )
              ],
            ),
          )
        ]),
      ));

  Widget sectionSavedList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: 10,
          (context, index) => Container(
            padding: EdgeInsets.all(20),
            height: 250,
            color: colors[index % colors.length],
            child: AutoSizeText(
              "citation mega ultra filosofica strappalacrime salvata",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      );
}
