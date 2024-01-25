import 'dart:convert';

import 'package:flutter/services.dart';

class DataLoad {
  Future<Map<String, dynamic>> JsonLoad(String filename) async {
    String data = await rootBundle.loadString('assets/jsons/${filename}.json');
    Map<String, dynamic> mbtidata = jsonDecode(data);
    return mbtidata;
  }
}
