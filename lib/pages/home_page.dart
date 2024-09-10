import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:loved_cit/repository/loved_citation_list.dart';
import 'package:loved_cit/repository/quote_repository.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<String> citationFuture;
  final lovedCitationList = LovedCitationList();

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
  void initState() {
    // TODO: implement initState
    super.initState();
    lovedCitationList.initialize().then((_) => setState(() {}));
    getCitation();
  }

  getCitation() {
    citationFuture = CitationRepository.get();
  }

  void addLovedCitation(String citation) async {
    await lovedCitationList.create(citation);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Trump's Thoughts"),
      ),
      body: Center(
        child: CustomScrollView(
          slivers: [sectionCit(), sectionSavedList()],
        ),
      ),
    );
  }

  Widget sectionCit() => SliverToBoxAdapter(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
            future: citationFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              } else {
                // print(snapshot.data);

                return Stack(children: [
                  SizedBox(
                    child: Center(
                      child: AutoSizeText(
                        snapshot.data!,
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
                          onPressed: () {
                            setState(() {
                              getCitation();
                            });
                          },
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
                          onPressed: () {
                            addLovedCitation(snapshot.data!);
                          },
                          icon: Icon(
                            Icons.favorite_outline,
                            color: Colors.red[300],
                            size: 50,
                          ),
                        )
                      ],
                    ),
                  )
                ]);
              }
            }),
      ));

  Widget sectionSavedList() => SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: lovedCitationList.citations.length,
          (context, index) => Container(
            padding: EdgeInsets.all(20),
            height: 250,
            color: colors[index % colors.length],
            child: AutoSizeText(
              lovedCitationList.citations[index].text,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      );
}
