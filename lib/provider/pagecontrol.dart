import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

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
  bool delete_state = false;
  Map<String, dynamic> follow_data = {};
  AuthStore authStore = AuthStore();
  String recent_page = 'page_1';
  Map<String, bool> recent_filter_list = {};
  String filter_text = 'update';
  String filter_text_kor = '최신순';
  bool post_delete_active = false;
  List<String> post_delete_select = [];
  Map<String, String> project_applicant_type = {};

  void Page_Reload() {
    notifyListeners();
  }

  void Next(BuildContext context) {
    pagenum++;

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

  void Delete_State(bool click) {
    delete_state = click;
    notifyListeners();
  }

  void Get_Follow(Map<String, dynamic> data) {
    follow_data = data;
    notifyListeners();
  }

  void Delete_Follow(String type, String id) {
    for (int index = 0; index < follow_data[type].length; index++) {
      if (follow_data[type][index]['id'] == id) {
        follow_data[type].removeAt(index);
        notifyListeners();
      }
    }
    print(follow_data);
    notifyListeners();
  }

  void Change_Recent_page(String page) {
    recent_page = page;
    notifyListeners();
  }

  void Recent_Active(String text) {
    if (!recent_filter_list.containsKey(text)) {
      recent_filter_list[text] = false;
    }
    if (text == '전체') {
      recent_filter_list.forEach((key, value) {
        recent_filter_list[key] = false;
      });
      recent_filter_list['전체'] = true;
    } else {
      recent_filter_list['전체'] = false;
      recent_filter_list[text] = !recent_filter_list[text]!;
    }
    notifyListeners();
  }

  void Drop_Down(String text) {
    filter_text = text;
    notifyListeners();
  }

  void Drop_Down_kor(String text) {
    filter_text_kor = text;
    notifyListeners();
  }

  void Post_Delete_Active() {
    post_delete_active = !post_delete_active;
    notifyListeners();
  }

  void Post_Delete_Select(dynamic data) {
    if (data.runtimeType == List<String>) {
      if (data.length == post_delete_select.length) {
        post_delete_select = [];
      } else {
        post_delete_select = List.from(data);
      }
    } else {
      if (post_delete_select.contains(data)) {
        post_delete_select.remove(data);
      } else if (data.runtimeType == String) {
        post_delete_select.add(data);
      }
    }
    notifyListeners();
  }

  void Project_Change_Type(String type, String content) {
    project_applicant_type[type] = content;
    notifyListeners();
  }
}
