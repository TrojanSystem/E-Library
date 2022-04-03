import 'package:example/items/top_authors_item.dart';
import 'package:example/model/data_hub.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopAuthorsScreen extends StatelessWidget {
  const TopAuthorsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final names = Provider.of<DataHub>(context).pdfList;

    final x = names.map((e) => e).toSet().toList();


    return SizedBox(
      height: 130,
      child: Consumer<DataHub>(
        builder: (context, topAuthour, child) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: x.length,
          itemBuilder: (context, index) {
                       return TopAuthorsItem(
              image: x[index]['author_image'],
              names: x[index]['author_name'],
              link: x[index]['pdf_url'],
            );
          },
        ),
      ),
    );
  }
}
