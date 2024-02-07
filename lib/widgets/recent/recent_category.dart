import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/widgets/recent/tag_slot_build.dart';

class Recent_Category extends StatefulWidget {
  const Recent_Category({super.key});

  @override
  State<Recent_Category> createState() => _Recent_CategoryState();
}

class _Recent_CategoryState extends State<Recent_Category> {
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
