import 'package:bottom_picker/widgets/simple_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Project_Applicant_Type extends StatefulWidget {
  final List<String> text_list;
  const Project_Applicant_Type(this.text_list);

  @override
  State<Project_Applicant_Type> createState() => _Project_Applicant_TypeState();
}

class _Project_Applicant_TypeState extends State<Project_Applicant_Type> {
  List<Text> text_widget = [];
  String choice_text = '';
  int start_index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Change_Type();
    InPut_Text();
  }

  void InPut_Text() {
    if (context
        .read<Page_Controller>()
        .project_applicant_type
        .containsKey('type')) {
      setState(() {
        choice_text =
            context.read<Page_Controller>().project_applicant_type['type']!;
        start_index = widget.text_list.indexOf(choice_text);
      });
    } else {
      setState(() {
        choice_text = widget.text_list[0];
      });
    }
  }

  void Change_Type() {
    for (String text in widget.text_list) {
      print(text);
      Text widget_text = Text(
        text,
      );
      setState(() {
        text_widget.add(widget_text);
      });
    }
    print(text_widget);
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: 360,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 360,
              height: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 32,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFFCCCCCC),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 141,
              margin: EdgeInsets.symmetric(vertical: 24),
              child: SimplePicker(
                selectionOverlay: Container(),
                items: text_widget,
                onChange: (p0) {
                  setState(() {
                    choice_text = widget.text_list[p0];
                  });
                },
                selectedItemIndex: start_index,
                textStyle: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
                itemExtent: 33,
              ),
            ),
            GestureDetector(
              onTap: () {
                context
                    .read<Page_Controller>()
                    .Project_Change_Type('type', choice_text);
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFF0059FF)),
                child: Center(
                  child: Text(
                    '선택하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
