import 'package:bottom_picker/widgets/simple_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/jsondata/dataload.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Project_Applicant_MBTI extends StatefulWidget {
  const Project_Applicant_MBTI();

  @override
  State<Project_Applicant_MBTI> createState() => _Project_Applicant_MBTIState();
}

class _Project_Applicant_MBTIState extends State<Project_Applicant_MBTI> {
  List<Text> text_widget = [];
  String choice_text = '';
  int start_index = 0;
  Map<String, dynamic> mbti = {};
  bool page_load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Page_load();
  }

  void Page_load() async {
    await Change_Type();
    InPut_Text();

    setState(() {
      page_load = true;
    });
  }

  void InPut_Text() {
    if (context
        .read<Page_Controller>()
        .project_applicant_type
        .containsKey('mbti')) {
      setState(() {
        choice_text =
            context.read<Page_Controller>().project_applicant_type['mbti']!;
        start_index = mbti.keys.toList().indexOf(choice_text);
      });
    } else {
      setState(() {
        choice_text = mbti.keys.toList()[0];
      });
    }
  }

  Future<void> Change_Type() async {
    Map<String, dynamic> mbti_data = await DataLoad().JsonLoad('mbti');
    setState(() {
      mbti = mbti_data;
    });
    for (String text in mbti.keys) {
      print(text);
      Text widget_text = Text(
        text,
      );
      setState(() {
        text_widget.add(widget_text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return page_load
        ? IntrinsicHeight(
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
                          choice_text = mbti.keys.toList()[p0];
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
                          .Project_Change_Type('mbti', choice_text);
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
          )
        : Container();
  }
}
