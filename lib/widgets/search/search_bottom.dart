import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Search_Bottom_Sheet extends StatefulWidget {
  const Search_Bottom_Sheet({super.key});

  @override
  State<Search_Bottom_Sheet> createState() => _Search_Bottom_SheetState();
}

class _Search_Bottom_SheetState extends State<Search_Bottom_Sheet> {
  List<String> type = ['제목', '내용', '작성자', '댓글'];
  List<String> category = ['LOG', '커뮤니티', '프로젝트', '내 게시물'];

  @override
  Widget build(BuildContext context) {
    return Consumer<Page_Controller>(
      builder: (context, pageController, _) {
        return IntrinsicHeight(
          child: Container(
            width: 360,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 360,
                  height: 28,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 32,
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xFFCCCCCC),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '검색항목',
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 13,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}