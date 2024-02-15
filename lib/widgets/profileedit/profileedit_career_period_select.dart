import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class Profile_Edit_Career_Period_Select extends StatefulWidget {
  final String text;
  const Profile_Edit_Career_Period_Select(this.text);

  @override
  State<Profile_Edit_Career_Period_Select> createState() =>
      _Profile_Edit_Career_Period_SelectState();
}

class _Profile_Edit_Career_Period_SelectState
    extends State<Profile_Edit_Career_Period_Select> {
  int year_data = 0;
  int month_data = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Input_Date();
  }

  void Input_Date() {
    if (widget.text != '') {
      RegExp regExp = RegExp(r'(\d+)년 (\d+)개월');
      final match = regExp.firstMatch(widget.text);

      if (match != null) {
        setState(() {
          year_data = int.parse(match.group(1)!);
          month_data = int.parse(match.group(2)!);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 311,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          SizedBox(
            height: 24,
          ),
          Text(
            '기간을 선택해주세요',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            width: 300,
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberPicker(
                  value: year_data,
                  minValue: 0,
                  maxValue: 99,
                  itemWidth: 30,
                  infiniteLoop: true,
                  onChanged: (value) {
                    setState(() {
                      year_data = value;
                    });
                  },
                  itemHeight: 40,
                  textStyle: TextStyle(
                    color: Color(0xFFCACACA),
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                  selectedTextStyle: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '년',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 56,
                ),
                NumberPicker(
                  value: month_data,
                  minValue: 01,
                  maxValue: 11,
                  itemWidth: 26,
                  infiniteLoop: true,
                  onChanged: (value) {
                    setState(() {
                      month_data = value;
                    });
                  },
                  itemHeight: 40,
                  textStyle: TextStyle(
                    color: Color(0xFFCACACA),
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                  selectedTextStyle: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '개월',
                  style: TextStyle(
                    color: Color(0xFF1D1D1D),
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 23,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, [year_data, month_data]);
            },
            child: Container(
              width: 300,
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFF0059FF)),
              child: Center(
                child: Text(
                  '설정완료',
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
    );
  }
}
