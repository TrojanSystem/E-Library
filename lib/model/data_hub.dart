import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataHub extends ChangeNotifier {
  List<dynamic> _responseBody = [];

  List<dynamic> get pdfList => _responseBody;
  List<dynamic> _authorNamesList = [];

  List<dynamic> get authorNameLists => _authorNamesList;

  bool isLoading = false;

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
