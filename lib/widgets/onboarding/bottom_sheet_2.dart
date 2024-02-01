import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Bottom_Modal_Sheet_2 extends StatefulWidget {
  const Bottom_Modal_Sheet_2({super.key});

  @override
  State<Bottom_Modal_Sheet_2> createState() => _Bottom_Modal_Sheet_2State();
}

class _Bottom_Modal_Sheet_2State extends State<Bottom_Modal_Sheet_2> {
  int year_data = 0;
  int month_data = 1;

  Future<void> showPicker(BuildContext context) async {
    int firstValue = 0;
    int secondValue = 1;

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Select Values'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NumberPicker(
                    value: firstValue,
                    minValue: 0,
                    maxValue: 99,
                    onChanged: (value) {
                      firstValue = value;
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  NumberPicker(
                    value: secondValue,
                    minValue: 1,
                    maxValue: 12,
                    onChanged: (value) {
                      secondValue = value;
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // 선택된 값 사용
                  print('First Value: $firstValue, Second Value: $secondValue');
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Page_Controller>(builder: (context, pageController, _) {
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
              context.read<Page_Controller>().select_info['career_type']![0] ==
                      '경력자입니다'
                  ? '경력 기간'
                  : '교육 기간',
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
                    maxValue: 12,
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
                context
                    .read<Page_Controller>()
                    .Period_Save([year_data.toString(), month_data.toString()]);
                context.read<Page_Controller>().select_info['career_period'] =
                    [];
                context.read<Page_Controller>().Add_Information('career_period',
                    '${context.read<Page_Controller>().period_save[0]}년 ${context.read<Page_Controller>().period_save[1]}개월');
                Navigator.pop(context);
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
    });
  }
}
