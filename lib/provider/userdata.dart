import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class User_Data with ChangeNotifier {
  AuthStore auth = AuthStore();
  RecordAuth record = RecordAuth();
  Map<String, dynamic> user_data = {};
  Map<String, dynamic> save_data = {};

  void Save_Auth(
      RecordAuth recordAuth, AuthStore authStore, Map<String, dynamic> data) {
    auth = authStore;
    record = recordAuth;
    user_data = data;
    notifyListeners();
  }

  void User_Data_Update(Map<String, dynamic> data) {
    user_data = data;
    notifyListeners();
  }

  void LogOut() {
    auth.clear();
    record.meta.clear();
    user_data.clear();
    notifyListeners();
  }

  void Nickname_Save(String text) {
    save_data['nickname'] = text;
    notifyListeners();
  }

  void Introduction_Save(String text) {
    save_data['introduction'] = text;
    notifyListeners();
  }

  void Language_Save(String text) {
    if (!save_data.containsKey('language')) {
      save_data['language'] = [];
    }
    save_data['language'].add(text);
    notifyListeners();
  }

  void Language_Delete(String text) {
    save_data['language'].remove(text);
    notifyListeners();
  }

  void Develop_Save(String text) {
    if (!save_data.containsKey('develop_type')) {
      save_data['develop_type'] = [];
    }
    save_data['develop_type'].add(text);
    notifyListeners();
  }

  void Develop_Delete(String text) {
    save_data['develop_type'].remove(text);
    notifyListeners();
  }

  void Service_Save(String text) {
    if (!save_data.containsKey('service')) {
      save_data['service'] = [];
    }
    save_data['service'].add(text);
    notifyListeners();
  }

  void Service_Delete(String text) {
    save_data['service'].remove(text);
    notifyListeners();
  }

  void Career_Save(Map<String, String> data) {
    if (!save_data.containsKey('career')) {
      save_data['career'] = {};
    }
    print('진입 22');
    save_data['career'][data['id']] = data;
    print('진입 33');
    print(data);
    print(data['id']);
    notifyListeners();
  }

  void Career_Delete(String key) {
    save_data['career'].remove(key);
    notifyListeners();
  }

  void Project_Save(Map<String, String> data) {
    save_data['project'] = data;
    notifyListeners();
  }

  void MBTI_Save(String text) {
    save_data['mbti'] = text;
    notifyListeners();
  }

  void Data_Delete() {
    save_data.clear();
    notifyListeners();
  }
}
