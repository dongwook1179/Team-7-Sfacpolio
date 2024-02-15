import 'package:bottom_picker/widgets/simple_picker.dart';
import 'package:flutter/material.dart';

class Profile_Edit_Career_type_Select extends StatefulWidget {
  final String select;
  const Profile_Edit_Career_type_Select(this.select);

  @override
  State<Profile_Edit_Career_type_Select> createState() =>
      _Profile_Edit_Career_type_SelectState();
}

class _Profile_Edit_Career_type_SelectState
    extends State<Profile_Edit_Career_type_Select> {
  List<Text> text_widget = [];
  String choice_text = '';
  int start_index = 0;
  List<String> career_type = ['경력', '신입'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Page_load();
  }

  void Page_load() async {
    Change_Type();
    InPut_Text();
  }

  void InPut_Text() {
    if (widget.select != '') {
      setState(() {
        choice_text = widget.select;
        start_index = career_type.indexOf(choice_text);
      });
    } else {
      setState(() {
        choice_text = career_type[0];
      });
    }
  }

  void Change_Type() {
    for (String text in career_type) {
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
            SizedBox(
              height: 24,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                '경력 타입을 선택하세요.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
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
                    choice_text = career_type[p0];
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
    );
  }
}
