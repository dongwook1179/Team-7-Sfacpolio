import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class User_Data with ChangeNotifier {
  AuthStore auth = AuthStore();
  RecordAuth record = RecordAuth();
  Map<String, dynamic> user_data = {};

  void Save_Auth(
      RecordAuth recordAuth, AuthStore authStore, Map<String, dynamic> data) {
    auth = authStore;
    record = recordAuth;
    user_data = data;
    notifyListeners();
  }

  void LogOut() {
    auth.clear();
    record.meta.clear();
    notifyListeners();
  }
}
