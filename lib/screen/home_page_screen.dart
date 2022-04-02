import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:example/items/search_item.dart';
import 'package:example/screen/new_book_screen.dart';
import 'package:example/screen/recommended_book_screen.dart';
import 'package:example/screen/top_authors_screen.dart';
import 'package:example/screen/trending_book_screen.dart';
import 'package:example/screen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'slide.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  Future<void> _handleRefresh() async {
    return await Future.delayed(
      const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('E-Library'),
      // ),
      backgroundColor: Colors.white,
      body: LiquidPullToRefresh(
        height: 100,
        backgroundColor: Colors.deepPurple[200],
        color: Colors.deepPurple,
        animSpeedFactor: 2,
        showChildOpacityTransition: false,
        // key if you want to add
        onRefresh: _handleRefresh,
        child: ListView(
          children: const [
            SizedBox(
              height: 10,
            ),
            UserScreen(),
            //  const Slide(),
            NewBookScreen(),

            TrendingBookScreen(),
            RecommendedBookScreen(),
            SizedBox(
              height: 10,
            ),
            TopAuthorsScreen(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const CircleAvatar(
          backgroundImage: AssetImage('images/10.jpg'),
          radius: 45,
          backgroundColor: Colors.blue,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue[800],
        animationCurve: Curves.easeInCubic,
        backgroundColor: Colors.white,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(
            Icons.search_sharp,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.category_outlined,
            size: 30,
          ),
          Icon(
            Icons.menu_sharp,
            size: 30,
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}
