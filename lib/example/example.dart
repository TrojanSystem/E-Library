import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/example/file_provider.dart';
import 'package:example/reader_class/pdf_reader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Example extends StatefulWidget {
  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final _firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookList = Provider.of<FileProvider>(context).firebaseList;
    final rating = bookList.where((element) => element['rate'] <= 4).toList();
    print('rating $rating');
    final y = bookList.map((element) => element['author_image']).toList();
    print(y);
    final x = bookList.map((element) {
      DateTime dt = (element['date'] as Timestamp).toDate();

// 12 Hour format:
      var d12 = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
      print(d12);
    }).toList();
    print(x);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Firebase'),
      ),
      body: Consumer<FileProvider>(
        builder: (context, data, child) => ListView.builder(
          itemCount: data.firebaseList.length,
          itemBuilder: (context, index) => Container(
            child: Text(data.firebaseList[index]['author_name']),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(data.firebaseList[index]['author_image']),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => PdfReader(
                  name: bookList[3]['name'], url: bookList[3]['pdf_url']),
            ),
          );
        },
      ),
    );
  }
}

// StreamBuilder<QuerySnapshot>(
// stream: _firestore.collection('bookStore').snapshots(),
// builder: (BuildContext context, AsyncSnapshot<dynamic> snapShot) {
// if (!snapShot.hasData) {
// return const Center(
// child: CircularProgressIndicator(
// color: Colors.red,
// ),
// );
// }
// final data = snapShot.data.docs;
// return ListView.builder(
// itemCount: data.length,
// itemBuilder: (context, index) => ListTile(
// title: Text(data[index]['author_name']),
// ),
// );
// },
// ),
