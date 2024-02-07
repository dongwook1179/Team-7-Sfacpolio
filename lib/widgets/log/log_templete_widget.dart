import 'package:flutter/material.dart';
import 'package:team_7_sfacpolio/log_templete_preview_page.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

class LogTempleteWidget extends StatelessWidget {
  final String content;
  final String tagname;
  const LogTempleteWidget(
      {super.key, required this.content, required this.tagname});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: 324,
            child: Text(
              content,
              style: TextStyle(
                color: Color(0xFF7F7F7F),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 160,
                    height: 102,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/log/templete-1.png'), // 이미지 파일 경로 또는 네트워크 URL
                        fit: BoxFit.cover, // 이미지를 화면에 맞게 채우도록 설정
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LogTempletePreviewPage(),
                                  ),
                                );
                              },
                              child: Text(
                                '미리보기',
                                style: TextStyle(
                                  color: Color(0xFFB3B3B3),
                                  fontSize: 11,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Tag_Slot("${tagname} 01")),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 160,
                    height: 102,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/log/templete-2.png'), // 이미지 파일 경로 또는 네트워크 URL
                        fit: BoxFit.cover, // 이미지를 화면에 맞게 채우도록 설정
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                '미리보기',
                                style: TextStyle(
                                  color: Color(0xFFB3B3B3),
                                  fontSize: 11,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Tag_Slot("${tagname} 02")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    width: 160,
                    height: 102,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/log/templete-3.png'), // 이미지 파일 경로 또는 네트워크 URL
                        fit: BoxFit.cover, // 이미지를 화면에 맞게 채우도록 설정
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                            child: Text(
                              '미리보기',
                              style: TextStyle(
                                color: Color(0xFFB3B3B3),
                                fontSize: 11,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Tag_Slot("${tagname} 03")),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 160,
                    height: 102,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/log/templete-4.png'), // 이미지 파일 경로 또는 네트워크 URL
                        fit: BoxFit.cover, // 이미지를 화면에 맞게 채우도록 설정
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                            child: Text(
                              '미리보기',
                              style: TextStyle(
                                color: Color(0xFFB3B3B3),
                                fontSize: 11,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Tag_Slot("${tagname} 04")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    width: 160,
                    height: 102,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/log/templete-5.png'), // 이미지 파일 경로 또는 네트워크 URL
                        fit: BoxFit.cover, // 이미지를 화면에 맞게 채우도록 설정
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                            child: Text(
                              '미리보기',
                              style: TextStyle(
                                color: Color(0xFFB3B3B3),
                                fontSize: 11,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Tag_Slot("${tagname} 05")),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 160,
                    height: 102,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/log/templete-6.png'), // 이미지 파일 경로 또는 네트워크 URL
                        fit: BoxFit.cover, // 이미지를 화면에 맞게 채우도록 설정
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                            child: Text(
                              '미리보기',
                              style: TextStyle(
                                color: Color(0xFFB3B3B3),
                                fontSize: 11,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Tag_Slot("${tagname} 06")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    width: 160,
                    height: 102,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/log/templete-7.png'), // 이미지 파일 경로 또는 네트워크 URL
                        fit: BoxFit.cover, // 이미지를 화면에 맞게 채우도록 설정
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                            child: Text(
                              '미리보기',
                              style: TextStyle(
                                color: Color(0xFFB3B3B3),
                                fontSize: 11,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Tag_Slot("${tagname} 07")),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 160,
                    height: 102,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/log/templete-8.png'), // 이미지 파일 경로 또는 네트워크 URL
                        fit: BoxFit.cover, // 이미지를 화면에 맞게 채우도록 설정
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                            child: Text(
                              '미리보기',
                              style: TextStyle(
                                color: Color(0xFFB3B3B3),
                                fontSize: 11,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Tag_Slot("${tagname} 08")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 11.65,
          ),
        ],
      ),
    );
  }
}
