import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class User_Data with ChangeNotifier {
  AuthStore auth = AuthStore();
  RecordAuth record = RecordAuth();

  void Save_Auth(RecordAuth recordAuth, AuthStore authStore) {
    auth = authStore;
    record = recordAuth;

    notifyListeners();
  }

  void LogOut() {
    auth.clear();
    record.meta.clear();
    notifyListeners();
  }
}
