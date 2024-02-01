import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class CategoryMold extends StatefulWidget {
  final List<String> text_list;
  CategoryMold(this.text_list);

  @override
  State<CategoryMold> createState() => _CategoryMoldState();
}

class _CategoryMoldState extends State<CategoryMold> {
  Map<String, Widget> category_widget = {};
  Map<String, Color> border_color = {};
  Map<String, Color> text_color = {};
  Map<String, Color> back_color = {};
  Map<String, bool> category_bool = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (String text in widget.text_list) {
      border_color[text] = Color(0xFFB3B3B3);
      text_color[text] = Color(0xFF7F7F7F);
      back_color[text] = Color(0xFFFFFFFF);
      category_bool[text] = false;
      if (context.read<Page_Controller>().select_info['develop'] != null) {
        if (context
            .read<Page_Controller>()
            .select_info['develop']!
            .contains(text)) {
          border_color[text] = Color(0xFF0059FF);
          text_color[text] = Color(0xFF0059FF);
          back_color[text] = Color(0xFFFFFFFF);
          category_bool[text] = true;
        }
      }
    }
    Slot_Build();
  }

  void Color_Change(String text) {
    if (category_bool[text]!) {
      setState(
        () {
          border_color[text] = Color(0xFFB3B3B3);
          text_color[text] = Color(0xFF7F7F7F);
          back_color[text] = Color(0xFFFFFFFF);
          category_bool[text] = false;
        },
      );
    } else {
      setState(
        () {
          border_color[text] = Color(0xFF0059FF);
          text_color[text] = Color(0xFF0059FF);
          back_color[text] = Color(0xFFFFFFFF);
          category_bool[text] = true;
        },
      );
    }
  }

  void Slot_Build() {
    for (String text in widget.text_list) {
      category_widget[text] = GestureDetector(
        onTap: () {
          Color_Change(text);
          context.read<Page_Controller>().Add_Information('develop', text);
          Slot_Build();
        },
        child: IntrinsicWidth(
          child: Container(
            margin: EdgeInsets.only(bottom: 8, right: 8),
            padding: EdgeInsets.symmetric(horizontal: 10),
            // width: 30.0 + text.length * 11.0,
            height: 41,
            decoration: BoxDecoration(
                color: back_color[text],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: border_color[text]!)),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                color: text_color[text]!,
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            )),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 328,
        height: 540,
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Wrap(
          children: category_widget.values.toList(),
        ),
      ),
    );
  }
}
