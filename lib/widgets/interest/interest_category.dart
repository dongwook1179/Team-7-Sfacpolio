import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/interest/tag_slot_build.dart';

class Interest_Category extends StatefulWidget {
  const Interest_Category({super.key});

  @override
  State<Interest_Category> createState() => _Interest_CategoryState();
}

class _Interest_CategoryState extends State<Interest_Category> {
  List<String> tag_list = [
    '전체',
    '프론트엔드',
    'JavaScript',
    'C++',
    'DBA',
    '인공지능,머신러닝',
    '안드로이드',
    '게임클라이언트',
    '게임서버',
    'Swift',
    '블록체인'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360,
        padding: EdgeInsets.only(left: 16),
        child: Wrap(
          spacing: 3,
          runSpacing: 3,
          children: [for (String text in tag_list) Tag_Slot_Build(text)],
        ));
  }
}
