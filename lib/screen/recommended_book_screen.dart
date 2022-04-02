import 'package:example/items/recommended_book_item.dart';
import 'package:example/items/book_detail_item.dart';
import 'package:example/items/see_all_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../model/data_hub.dart';

class RecommendedBookScreen extends StatelessWidget {
  const RecommendedBookScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataHub>(
      builder: (context, data, child) => SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recommended for you',
                    style: kkTitles,
                  ),
                  Row(
                    children: [
                      const Text(
                        'See All',
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) =>
                                  SeeAllItems(seeAllList: data.pdfList),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_rounded),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 5),
                scrollDirection: Axis.horizontal,
                itemCount: data.pdfList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    final x = data.pdfList
                        .where((element) =>
                            element['author_name'] == 'Trevor Noah')
                        .toList();
                    print(x);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => BookDetailItem(
                          index: index,
                          title: data.pdfList[index]['name'],
                          name: data.pdfList[index]['author_name'],
                          image: data.pdfList[index]['cover_image'],
                          description: data.pdfList[index]['description'],
                          url: data.pdfList[index]['pdf_url'],
                        ),
                      ),
                    );
                  },
                  child: RecommendedBookItem(
                    title: data.pdfList[index]['name'],
                    name: data.pdfList[index]['author_name'],
                    image: data.pdfList[index]['cover_image'],
                    rate: (data.pdfList[index]['rate']).toString(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
