import 'package:example/items/category_item.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            children: [
              CategoryItem(
                color: Colors.green,
                title: 'Adventure',
                image: 'images/2.jpg',
                navigate: () {
                  //  Navigator.of(context).pushNamed(MixRatio.routeName);
                },
              ),
              CategoryItem(
                color: Colors.limeAccent,
                title: 'Fiction',
                image: 'images/1.jpg',
                navigate: () {
                  //  Navigator.of(context).pushNamed(Bar.routeName);
                },
              ),
              CategoryItem(
                color: Colors.teal,
                title: 'Crime',
                image: 'images/3.jpg',
                navigate: () {
                  // Navigator.of(context).pushNamed(AttendanceList.routeName);
                },
              ),
              CategoryItem(
                color: Colors.lightBlue,
                title: 'Educational',
                image: 'images/4.jpg',
                navigate: () {
                  //   Navigator.of(context).pushNamed(TodoList.routeName);
                },
              ),
              CategoryItem(
                color: Colors.grey,
                title: 'Audio Book',
                image: 'images/5.jpg',
                navigate: () {
                  //    Navigator.of(context).pushNamed(ShopList.routeName);
                },
              ),
              CategoryItem(
                color: Colors.pink,
                title: 'Top Authors',
                image: 'images/6.jpg',
                navigate: () {
                  //  Navigator.of(context).pushNamed(ConverterScreen.routeName);
                },
              ),
            ],
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
          ),
        ),
      ),
    );
  }
}
