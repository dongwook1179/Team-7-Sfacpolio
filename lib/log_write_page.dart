import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/widgets/log/log_templete_widget.dart';

class LogWritePage extends StatefulWidget {
  const LogWritePage({super.key});

  @override
  State<LogWritePage> createState() => _LogWritePageState();
}

class _LogWritePageState extends State<LogWritePage> {
  String selectedType = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              size: 16,
            ),
          ),
          title: Text(
            'LOG 쓰기',
            style: TextStyle(
              color: Color(0xFF020202),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 0.08,
            ),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(right: 16),
                child: Text(
                  '등록',
                  style: TextStyle(
                    color: Color(0xFF7F7F7F),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (selectedType.isEmpty)
                          Text(
                            '게시글의 주제를 선택해 주세요.',
                            style: TextStyle(
                              color: Color(0xFFB3B3B3),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        if (selectedType.isNotEmpty)
                          Text(
                            selectedType,
                            style: TextStyle(
                              color: Color(0xFFB3B3B3),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(context);
                          },
                          child: SvgPicture.asset(
                            "assets/icons/chevron-right.svg",
                            color: Color(0xFFB3B3B3),
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: 327,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFB3B3B3),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (selectedType.isEmpty)
                      Column(
                        children: [
                          Text(
                            '제목을 입력하세요.',
                            style: TextStyle(
                              color: Color(0xFF7F7F7F),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '내용을 입력하세요.',
                            style: TextStyle(
                              color: Color(0xFF7F7F7F),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 454,
                          ),
                        ],
                      ),
                    if (selectedType == "포트폴리오")
                      LogTempleteWidget(
                        content:
                            "포트폴리오는 주로 당신이 누구인지, 당신에게 동기를 부여하는 것이 무엇인지, 그리고 당신이 어떤 프로젝트를 수행했는지를 중심으로 작성해요. 다음은 사람들이 많이 쓰는 포트폴리오 템플릿 목록이예요.",
                        tagname: 'portfolio',
                      ),
                    Container(
                      width: 327,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFB3B3B3),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '@직군을 선택해 주세요.',
                      style: TextStyle(
                        color: Color(0xFF7F7F7F),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 76,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 360,
                height: 56,
                decoration: BoxDecoration(color: Color(0xFFF3F3F3)),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/icons/picture.svg"),
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset("assets/icons/smile.svg"),
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset("assets/icons/at-sign.svg"),
                        SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset("assets/icons/hash.svg"),
                      ],
                    ),
                    SvgPicture.asset("assets/icons/setting.svg"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            width: 360,
            height: 362,
            padding: EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 20),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '게시물의 주제를 선택해주세요.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, '포트폴리오');
                    },
                    child: Container(
                      child: Text(
                        '포트폴리오',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.28,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 324,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFE6E6E6),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, '프로젝트 경험');
                    },
                    child: Container(
                      child: Text(
                        '프로젝트 경험',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.28,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 324,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFE6E6E6),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, '개발 학습');
                    },
                    child: Container(
                      child: Text(
                        '개발 학습',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.28,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 324,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFE6E6E6),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, '아이디어');
                    },
                    child: Container(
                      child: Text(
                        '아이디어',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.28,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 324,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFE6E6E6),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, '대회 준비 기록');
                    },
                    child: Container(
                      child: Text(
                        '대회 준비 기록',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
    if (result != null) {
      setState(() {
        selectedType = result;
      });
    }
  }
}
