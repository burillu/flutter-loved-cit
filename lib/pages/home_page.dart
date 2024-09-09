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
          child: Container(
        padding: EdgeInsets.all(20),
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            // padding: EdgeInsets.all(20),
            // color: Colors.red,
            child: Center(
              child: Text(
                "Citation mega ultra filosofica strappalacrime",
                style: TextStyle(
                    fontSize: 35,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
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
}
