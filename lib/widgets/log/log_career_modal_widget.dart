import 'package:flutter/material.dart';

Future<void> LogCareerModalWidget(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: 328,
            child: _LogCareerCustomDialog(), // 커스텀 다이얼로그 위젯 사용
          ),
        ),
      );
    },
  );
}

class _LogCareerCustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 341,
      margin: EdgeInsets.all(0.0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '경험 사항',
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: '을 입력해주세요.',
                  style: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: 280,
            height: 1,
            decoration: BoxDecoration(color: Color(0xFF020202)),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              '기간',
              style: TextStyle(
                color: Color(0xFF020202),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: 280,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Color(0xFFF3F3F3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: TextField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: "0000년.0월.0일 ~ 0000년.0월.0일",
                hintStyle: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 7),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 8),
            child: Text(
              '수상/프로젝트명',
              style: TextStyle(
                color: Color(0xFF020202),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: 280,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Color(0xFFF3F3F3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: TextField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: "수상 또는 프로젝트명에 대해 입력해주세요.",
                hintStyle: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 7),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 144,
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF0059FF)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '취소',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0059FF),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 144,
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: Color(0xFF0059FF),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF0059FF)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '적용',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
