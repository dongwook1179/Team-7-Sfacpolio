import 'package:bottom_picker/widgets/simple_picker.dart';
import 'package:flutter/material.dart';

class Project_Create_Period_Select extends StatefulWidget {
  final int select;
  const Project_Create_Period_Select(this.select);

  @override
  State<Project_Create_Period_Select> createState() =>
      _Project_Create_Period_SelectState();
}

class _Project_Create_Period_SelectState
    extends State<Project_Create_Period_Select> {
  List<Text> text_widget = [];
  String choice_text = '';
  int start_index = 0;
  bool page_load = false;
  List<String> language_type = [];

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
    if (widget.select != 0) {
      setState(() {
        choice_text = '${widget.select}개월';
        start_index = widget.select - 1;
      });
    } else {
      setState(() {
        choice_text = '1개월';
      });
    }
  }

  void Change_Type() {
    for (int i = 1; i < 13; i++) {
      Text widget_text = Text(
        '${i}개월',
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
                '예상 진행 기간을 선택하세요.',
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
                    start_index = p0 + 1;
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
                Navigator.pop(context, start_index);
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
