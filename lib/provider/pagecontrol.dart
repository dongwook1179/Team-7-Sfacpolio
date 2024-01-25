import 'package:flutter/cupertino.dart';

class Page_Controller with ChangeNotifier {
  int pagenum = 1;
  Map<String, bool> slot_active = {};
  Map<String, dynamic> mbti_data = {};

  void Next(BuildContext context) {
    pagenum++;
    if (pagenum == 5) {
      pagenum = 1;
      // Navigator.push(context, CupertinoPageRoute(builder: (context)=> ));
    }
    notifyListeners();
  }

  void Previous() {
    pagenum--;
    if (pagenum == 0) {
      pagenum = 1;
    }
    notifyListeners();
  }

  void Slot_active(String text) {
    if (slot_active[text] != null) {
      if (slot_active[text]!) {
        slot_active.remove(text);
      }
    } else {
      slot_active[text] = true;
    }
    notifyListeners();
  }

  void Send_Data(Map<String, dynamic> data) {
    mbti_data = data;
    notifyListeners();
  }
}
