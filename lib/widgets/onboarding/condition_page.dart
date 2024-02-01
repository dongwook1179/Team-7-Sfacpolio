import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/condition_slots.dart';

class Condition_Page extends StatefulWidget {
  const Condition_Page({super.key});

  @override
  State<Condition_Page> createState() => _Condition_PageState();
}

class _Condition_PageState extends State<Condition_Page> {
  List<String> type = ['온라인', '오프라인'];
  List<String> period = [
    '기간 무관',
    '1~2개월',
    '3개월 이하',
    '3~6개월',
    '6~9개월',
    '9~12개월',
    '1년 이상'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '미팅 및 업무 활동',
              style: TextStyle(
                color: Color(0xFF020202),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              '중복선택',
              style: TextStyle(
                color: Color(0xFF999999),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Wrap(
              spacing: 12,
              children: [
                for (String text in type) Condition_Slots('type', text)
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              '프로젝트 기간',
              style: TextStyle(
                color: Color(0xFF020202),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (String text in period) Condition_Slots('period', text)
              ],
            )
          ],
        ),
      ),
    );
  }
}
