import 'package:flutter/material.dart';

import '../constants.dart';
import '../reader_class/pdf_reader.dart';

class BookDetailItem extends StatelessWidget {
  String url;
  int index;
  String name;
  String title;
  String image;
  String description;

  BookDetailItem(
      {this.image,
      this.title,
      this.name,
      this.description,
      this.url,
      this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.black,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 58),
                  child: SizedBox(
                    width: 200,
                    height: 250,
                    child: Image(
                        image: NetworkImage('http://192.168.1.11:8080/$image'),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 3.0,
                        blurRadius: 5.0,
                        color: Colors.blueAccent.withOpacity(0.7),
                      ),
                    ],
                    color: Colors.blue[800],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        title: Text(
                          title,
                          style: kkTileColors,
                        ),
                        subtitle: Text(
                          name,
                          style: kkTileColors,
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 20, letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 320,
            left: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(47, 36, 61, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => PdfReader(
                            url: "http://192.168.1.11:8080/" + url,
                            name: title,
                          ),
                        ),
                      );
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.book_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Read Book',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  height: 50,
                  width: 150,
                ),
                Container(
                  width: 3,
                  color: Colors.white,
                  height: 50,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(47, 36, 61, 1),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: GestureDetector(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.headset,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Play Book',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  height: 50,
                  width: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
