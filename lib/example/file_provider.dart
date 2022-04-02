import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FileProvider extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  final List<dynamic> _firebaseList = [];

  List<dynamic> get firebaseList => _firebaseList;

  Future getMethod() async {


    await for (var snap in _firestore.collection('bookStore').snapshots()) {

     for(var snapShot in snap.docs){

       _firebaseList.add(snapShot);
       notifyListeners();
     }

    }
    notifyListeners();
  }

// Future getMethod() async {
//   notifyListeners();
//   CollectionReference x = _firestore.collection('bookStore');
//   await x.get().then(
//         (value) => value.docs.forEach(
//           (element) {
//         return _firebaseList.add(element.data());
//       },
//     ),
//   );
//   notifyListeners();
// }
}
