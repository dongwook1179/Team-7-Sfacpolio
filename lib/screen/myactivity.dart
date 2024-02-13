import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/screen/interest.dart';
import 'package:team_7_sfacpolio/screen/mycomment.dart';
import 'package:team_7_sfacpolio/screen/mypost.dart';
import 'package:team_7_sfacpolio/screen/recent.dart';

class MyActivity extends StatefulWidget {
  const MyActivity({super.key});

  @override
  State<MyActivity> createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
  Map<String, Widget> pages = {
    '관심 게시물': Interest(),
    '최근 본 게시물': Recent(),
    '내 게시물': MyPost(),
    '내가 쓴 댓글': MyComment(),
  };
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: 360,
        margin: EdgeInsets.only(top: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (String key in pages.keys)
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => pages[key]!));
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 360,
                        height: 41,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2, color: Color(0xffF8F8F9))),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                key,
                                style: TextStyle(
                                  color: Color(0xFF333333),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/icons/chevron-right.svg',
                              width: 16,
                              height: 16,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
