import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class User_Data with ChangeNotifier {
  AuthStore auth = AuthStore();
  RecordAuth record = RecordAuth();
  List<Map<String, String>> language = [];
  List<Map<String, String>> develop_type = [];

  void Save_Auth(
      RecordAuth recordAuth,
      AuthStore authStore,
      List<Map<String, String>> language_data,
      List<Map<String, String>> develop_data) {
    auth = authStore;
    record = recordAuth;
    language = language_data;
    develop_type = develop_data;
    notifyListeners();
  }

  void LogOut() {
    auth.clear();
    record.meta.clear();
    notifyListeners();
  }
}
