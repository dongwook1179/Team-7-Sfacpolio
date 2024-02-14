import 'package:bottom_picker/widgets/simple_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';

class Project_Applicant_Use extends StatefulWidget {
  const Project_Applicant_Use({super.key});

  @override
  State<Project_Applicant_Use> createState() => _Project_Applicant_UseState();
}

class _Project_Applicant_UseState extends State<Project_Applicant_Use> {
  List<Text> text_widget = [];
  String choice_text = '';
  String choice_logo = '';
  int start_index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Change_Type();
    InPut_Text();
  }

  void InPut_Text() {
    List<Map<String, String>> language_data =
        context.read<User_Data>().user_data['language'];
    if (context
        .read<Page_Controller>()
        .project_applicant_type
        .containsKey('language')) {
      setState(() {
        choice_text =
            context.read<Page_Controller>().project_applicant_type['language']!;
        for (Map<String, String> data in language_data) {
          if (data['language']!.contains(choice_text)) {
            start_index =
                context.read<User_Data>().user_data['language'].indexOf(data);
            print(choice_text);
            print(start_index);
          }
        }
      });
    } else {
      setState(() {
        choice_text =
            context.read<User_Data>().user_data['language'][0]['language']!;
      });
    }
  }

  void Change_Type() {
    List<Map<String, String>> language_data =
        context.read<User_Data>().user_data['language'];
    for (Map<String, String> data in language_data) {
      Text widget_text = Text(
        '${data['language']}',
      );
      setState(() {
        text_widget.add(widget_text);
      });
    }
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
                selectionOverlay: Container(
                    // alignment: Alignment.centerLeft,
                    // child: SvgPicture.network(choice_logo),
                    ),
                items: text_widget,
                onChange: (p0) {
                  setState(() {
                    choice_text = context
                        .read<User_Data>()
                        .user_data['language'][p0]['language']!;
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
                    .Project_Change_Type('language', choice_text);
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
