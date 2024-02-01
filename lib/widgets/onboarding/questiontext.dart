import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../provider/pagecontrol.dart';

class QuestionText extends StatefulWidget {
  const QuestionText({super.key});

  @override
  State<QuestionText> createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText> {
  List<String> textlist_regular_1 = [
    '어떤 ',
    '주로 사용하는 ',
    '주로 관심있는 ',
    'OOO님의 ',
    'OOO님의 ',
    'OOO님이 '
  ];
  List<String> textlist_bold = [
    '개발 직군',
    '개발 언어',
    '업종',
    'MBTI ',
    '경력사항은 ',
    '선호하는 조건'
  ];
  List<String> textlist_regular_2 = [
    '에서 일하고 있나요?',
    '는 무엇인가요?',
    '은 무엇인가요?',
    '무엇인가요?',
    '무엇인가요?',
    '은 무엇인가요?'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 16, right: 24, bottom: 24),
      width: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: textlist_regular_1[
                          context.watch<Page_Controller>().pagenum - 1],
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: textlist_bold[
                          context.watch<Page_Controller>().pagenum - 1],
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: textlist_regular_2[
                          context.watch<Page_Controller>().pagenum - 1],
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 24,
                height: 24,
                child: SvgPicture.asset('assets/icons/x.svg'),
              )
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            context.watch<Page_Controller>().pagenum < 5
                ? '중복 선택 가능'
                : 'OOO님께 어울리는 글과 프로젝트를 추천해드려요',
            style: TextStyle(
              color: Color(0xFF999999),
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
