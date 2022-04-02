import 'package:flutter/material.dart';

import 'filter_by_author_name.dart';

class TopAuthorsItem extends StatelessWidget {
  final String image;
  final String names;
  final String link;

  TopAuthorsItem({this.image, this.names, this.link});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => FilterByAuthorName(
                  authorName: names, coverImage: image, linkTOPdf: link),
            ),
          );
        },
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage('http://192.168.1.11:8080/$image'),
                            fit: BoxFit.cover),
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                  ),
                ),
                Text(names),
              ],
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
