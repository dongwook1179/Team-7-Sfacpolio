import 'package:flutter/cupertino.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/languageslot.dart';

class Page_Controller with ChangeNotifier {
  int pagenum = 1;
  Map<String, bool> slot_active = {};
  Map<String, dynamic> mbti_data = {};
  String search = '';
  Map<String, Widget> widget_select = {};
  String language_text = '';

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

  void Input_Filter(String text) {
    search = text;
    print(search);
    notifyListeners();
  }

  void Input_Text(String text) {
    language_text = text;
    notifyListeners();
  }

  void Select_Widget(String text, Widget widget) {
    if (widget_select.containsKey(text)) {
      widget_select.remove(text);
    } else {
      widget_select[text] = widget;
    }
    print(widget_select);
    notifyListeners();
  }

  void Delete_Widget(String text) {
    widget_select.remove(text);
    notifyListeners();
  }
}
