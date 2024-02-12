import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditSearch extends StatefulWidget {
  const EditSearch({super.key});

  @override
  State<EditSearch> createState() => _EditSearchState();
}

class _EditSearchState extends State<EditSearch> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(children: [
          buildSection('개발언어', 3, ['javefaw', '언어를 검색해보세요']),
          buildSection('개발직군', 3, ['웹 풀스택', '프론트엔드', '서버/백엔드']),
          buildSection('관심업종', 3, ['건설', '식품', '선택해주세요']),
        ]),
      ),
    );
  }

  Widget buildSection(String title, int count, List<String> textFiledText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF020202),
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 250,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: SvgPicture.asset(
                'assets/icons/plus.svg',
                color: Color(0xFF0059FF),
                width: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        for (int i = 0; i < count; i++) ...[
          SizedBox(
            height: 8,
          ),
          if (title == '개발언어' && i < 2 || title != '개발언어')
            Visibility(
              visible: isExpanded || i < 3,
              child: Row(
                children: [
                  Container(
                    width: 270,
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFCCCCCC)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: textFiledText[i],
                        hintStyle: TextStyle(
                          color: Color(0xFF020202),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding: EdgeInsets.all(13),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  if (title == '개발언어' && i == 1 || title != '개발언어')
                    if ((title == '개발직군' && (i == 1 || i == 2)) ||
                        title != '개발직군')
                      if ((title == '관심업종' && (i == 1 || i == 2)) ||
                          title != '관심업종')
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 52,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF0059FF)),
                            child: Center(
                              child: Text(
                                '삭제',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 0.11,
                                ),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
        ],
      ],
    );
  }
}
