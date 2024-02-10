import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Project_Select_Box extends StatefulWidget {
  const Project_Select_Box({super.key});

  @override
  State<Project_Select_Box> createState() => _Project_Select_BoxState();
}

class _Project_Select_BoxState extends State<Project_Select_Box> {
  List<String> text_list = ['전체보기', '모집상태', '모집기간', '진행방향'];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 32,
      margin: EdgeInsets.only(top: 16, bottom: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 16,
            ),
            for (String text in text_list)
              IntrinsicWidth(
                child: Container(
                  height: 32,
                  margin: EdgeInsets.only(right: 6),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 1,
                          color: text_list.indexOf(text) != 0
                              ? Color(0xFF7F7F7F)
                              : Color(0xFF0059FF)),
                      color: text_list.indexOf(text) != 0
                          ? Color(0xFFFFFFFF)
                          : Color(0xFF0059FF)),
                  child: Row(
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          color: text_list.indexOf(text) != 0
                              ? Color(0xFF020202)
                              : Colors.white,
                          fontSize: 12,
                          fontFamily: 'Pretendard',
                          fontWeight: text_list.indexOf(text) != 0
                              ? FontWeight.w400
                              : FontWeight.w700,
                        ),
                      ),
                      text_list.indexOf(text) != 0
                          ? Container(
                              width: 16,
                              height: 16,
                              margin: EdgeInsets.only(left: 4),
                              child: SvgPicture.asset(
                                  'assets/icons/chevron-down.svg'),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            SizedBox(
              width: 16,
            )
          ],
        ),
      ),
    );
  }
}
