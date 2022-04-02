import 'package:example/items/top_authors_item.dart';
import 'package:example/model/data_hub.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopAuthorsScreen extends StatelessWidget {
  const TopAuthorsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final names = Provider.of<DataHub>(context).authorNameLists;
    return SizedBox(
      height: 130,
      child: Consumer<DataHub>(
        builder: (context, topAuthour, child) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: topAuthour.pdfList.length,
          itemBuilder: (context, index) => TopAuthorsItem(
            image: topAuthour.pdfList[index]['author_image'],
            names: topAuthour.pdfList[index]['author_name'],
            link: topAuthour.pdfList[index]['pdf_url'],
          ),
        ),
      ),
    );
  }
}
