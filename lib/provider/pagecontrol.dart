import 'package:flutter/cupertino.dart';

class Page_Controller with ChangeNotifier {
  int pagenum = 1;
  // 온보딩 선택항목 저장
  Map<String, List<String>> select_info = {};
  Map<String, dynamic> mbti_data = {};
  Map<String, Widget> service_data = {};
  String search = '';
  Map<String, Widget> widget_select = {};
  String language_text = '';
  List<String> period_save = [];
  String career_save = '';
  Map<String, List<String>> filter = {
    'type': [
      '제목',
    ]
  };
  List<String> tag_list = [];
  Map<String, dynamic> get_data_search = {};

  void Next(BuildContext context) {
    pagenum++;
    if (pagenum == 7) {
      pagenum = 1;
      // Navigator.push(context, CupertinoPageRoute(builder: (context)=> ));
    }
    notifyListeners();
  }

  void Add_Information(String type, String text) {
    print('맵 이전 ${select_info}');
    if (!select_info.containsKey(type)) {
      select_info[type] = [text];
    } else if (select_info[type]!.contains(text)) {
      select_info[type]!.remove(text);
    } else {
      select_info[type]!.add(text);
    }
    print('맵 이후 ${select_info}');
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

  void Period_Save(List<String> text_List) {
    period_save.clear();
    period_save = text_List;
    notifyListeners();
  }

  void Service_Data(String text, Widget widget) {
    if (service_data.containsKey(text)) {
      service_data.remove(text);
    } else {
      service_data[text] = widget;
    }
    print(service_data);
    notifyListeners();
  }

  void Select_Fillter(String type, String text) {
    if (!filter.containsKey(type)) {
      filter[type] = [];
      filter[type]!.add(text);
    } else if (filter[type]!.contains(text)) {
      filter[type]!.remove(text);
    } else {
      filter[type]!.add(text);
    }
    print(filter);
    notifyListeners();
  }

  void Search_Input_Tag(String text) {
    tag_list.add(text);
    notifyListeners();
  }

  void Search_Delete_Tag(String text) {
    tag_list.remove(text);
    notifyListeners();
  }

  void Reset_Filter() {
    tag_list.clear();
    filter.clear();
    notifyListeners();
  }

  void Get_Data(Map<String, dynamic> datas) {
    get_data_search = datas;
    notifyListeners();
  }
}
