import 'package:example/items/user_screen_booked.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/data_hub.dart';

class UserScreenItemDetail extends StatelessWidget {
  const UserScreenItemDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<DataHub>(context).pdfList;
    final filtered =
        user.where((element) => element['bookmark'] == 1.toString()).toList();
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('My Books'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Statistics',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2),
                      ),
                      Text(
                        'Your statistics for the year',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 18, 25, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Reading now',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                  filtered.isEmpty
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 150.0),
                            child: Text('No Bookmark Yet!'),
                          ),
                        )
                      : Expanded(
                          child: UserScreenBooked(w: _w),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
