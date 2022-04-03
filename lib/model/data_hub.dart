import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataHub extends ChangeNotifier {
  List<dynamic> _responseBody = [];

  List<dynamic> get pdfList => _responseBody;
  List<dynamic> _authorNamesList = [];
  List<dynamic> _userSelection = [];

  List<dynamic> get userSelection => _userSelection;

  List<dynamic> get authorNameLists => _authorNamesList;

  bool isClicked = false;
  bool isLoading = false;

  void changeBookmarkStatus(bool isClickeds) {
    isClicked = !isClicked;
    isClickeds = isClicked;

   notifyListeners();
    print('assign $isClicked');
    print(isClickeds);

  }

  Future getMethod() async {
    isLoading = true;
    notifyListeners();
    String theUrl = 'http://192.168.1.11:8080/project/pdffile.php';
    notifyListeners();
    var res = await http
        .get(Uri.parse(theUrl), headers: {"Accept": "application/json"});
    _responseBody = json.decode(res.body);

    isLoading = false;
    notifyListeners();
  }

  Future getUpdateMethod(String booked, String name) async {
    notifyListeners();
    String theUrl = 'http://192.168.1.11:8080/project/update.php';
    notifyListeners();
    var res = await http.post(
      Uri.parse(theUrl),
      headers: {"Accept": "application/json"},
      body: {'isBooked': booked, 'title': name},
    );
     json.decode(res.body);
    notifyListeners();
  }

  Future getAuthorName() async {
    notifyListeners();
    String theUrls = 'http://192.168.1.11:8080/project/selection.php';
    notifyListeners();
    var ress = await http
        .get(Uri.parse(theUrls), headers: {"Accept": "application/json"});
    _authorNamesList = json.decode(ress.body);

    notifyListeners();
  }
}
