import 'package:bottom_picker/widgets/simple_picker.dart';
import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/jsondata/dataload.dart';

class Profile_Edit_MBTI_Select extends StatefulWidget {
  final String text;
  const Profile_Edit_MBTI_Select(this.text);

  @override
  State<Profile_Edit_MBTI_Select> createState() =>
      _Profile_Edit_MBTI_SelectState();
}

class _Profile_Edit_MBTI_SelectState extends State<Profile_Edit_MBTI_Select> {
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
    if (widget.text != '') {
      setState(() {
        choice_text = widget.text;
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
                      Navigator.pop(context, choice_text);
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
