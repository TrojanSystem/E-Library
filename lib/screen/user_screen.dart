import 'package:example/items/search_item.dart';
import 'package:flutter/material.dart';
import '../items/user_screen_item.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              flex: 5,
              child: UserScreenItem(),
            ),

            Expanded(
              flex: 1,
              child: Row(
                children: const [
                  Icon(Icons.notifications),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.shopping_cart),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),

        SearchItem(),
      ],
      // mainAxisSize: MainAxisSize.min,
      //crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}

