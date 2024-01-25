import 'package:flutter/cupertino.dart';

class UseLanguage extends StatefulWidget {
  const UseLanguage({super.key});

  @override
  State<UseLanguage> createState() => _UseLanguageState();
}

class _UseLanguageState extends State<UseLanguage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Container(
            width: 300,
            height: 48,
            margin: EdgeInsets.symmetric(horizontal: 6),
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 24,
                  height: 24,
                  child: Icon(CupertinoIcons.search),
                ),
                CupertinoTextField(
                  placeholder: '개발 언어 검색',
                  placeholderStyle: TextStyle(
                    color: Color(0xFF4C4C4C),
                    fontSize: 14,
                    // fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
