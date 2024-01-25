import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../provider/pagecontrol.dart';

class QuestionText extends StatefulWidget {
  const QuestionText({super.key});

  @override
  State<QuestionText> createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText> {
  List<String> textlist_regular_1 = ['어떤 ', '주로 사용하는 ', '주로 관심있는 ', 'OOO님은 '];
  List<String> textlist_bold = ['개발 직군', '개발 언어', '업종', '어떤 사람'];
  List<String> textlist_regular_2 = [
    '에서 일하고 있나요?',
    '는 무엇인가요?',
    '은 무엇인가요?',
    '인가요?'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.watch<Page_Controller>().pagenum == 4
          ? EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 18)
          : EdgeInsets.all(24),
      width: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: textlist_regular_1[
                      context.watch<Page_Controller>().pagenum - 1],
                  style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 18,
                    // fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: textlist_bold[
                      context.watch<Page_Controller>().pagenum - 1],
                  style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 18,
                    // fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: textlist_regular_2[
                      context.watch<Page_Controller>().pagenum - 1],
                  style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 18,
                    // fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          context.watch<Page_Controller>().pagenum == 4
              ? SizedBox()
              : SizedBox(
                  height: 4,
                ),
          context.watch<Page_Controller>().pagenum == 4
              ? SizedBox()
              : Text(
                  '중복 선택 가능',
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 12,
                    // fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                )
        ],
      ),
    );
  }
}
