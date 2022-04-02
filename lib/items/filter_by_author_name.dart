import 'package:example/model/data_hub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../reader_class/pdf_reader.dart';

class FilterByAuthorName extends StatefulWidget {
  final String authorName;
  final String coverImage;
  final String linkTOPdf;

  const FilterByAuthorName({this.authorName, this.coverImage, this.linkTOPdf});

  @override
  _FilterByAuthorNameState createState() => _FilterByAuthorNameState();
}

class _FilterByAuthorNameState extends State<FilterByAuthorName> {
  @override
  Widget build(BuildContext c) {
    final filter = Provider.of<DataHub>(context).pdfList;
    final filterByAuthor = filter
        .where((element) => element['author_name'] == widget.authorName)
        .toList();
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.authorName),
          centerTitle: true,
          brightness: Brightness.dark),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: filterByAuthor.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: const Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: -300,
                verticalOffset: -850,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'http://192.168.1.11:8080/${filterByAuthor[index]['cover_image']}'),
                                fit: BoxFit.fill),
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Author : ${filterByAuthor[index]['author_name']}'
                                    .toString(),
                                style: kkFilteredAuthor,
                              ),
                              Text(
                                'Title : ${filterByAuthor[index]['name'].toString()}',
                                style: kkFilteredAuthor,
                              ),
                              Text(
                                'Rate : ${filterByAuthor[index]['rate'].toString()}',
                                style: kkFilteredAuthor,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => PdfReader(
                                            url: "http://192.168.1.11:8080/" +
                                                filterByAuthor[index]['pdf_url']
                                                    .toString(),
                                            name:filterByAuthor[index]['name'],
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.book,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.headset,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: _w / 20),
                  height: _w / 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 40,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
