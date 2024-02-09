import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Interest_Bottom_Sheet extends StatefulWidget {
  const Interest_Bottom_Sheet({super.key});

  @override
  State<Interest_Bottom_Sheet> createState() => _Interest_Bottom_SheetState();
}

class _Interest_Bottom_SheetState extends State<Interest_Bottom_Sheet> {
  List<String> tab_list = ['최신순', '조회순', '좋아요순'];

  @override
  Widget build(BuildContext context) {
    return Consumer<Page_Controller>(
      builder: (context, pageController, _) {
        return Container(
          width: 360,
          height: 179,
          padding: EdgeInsets.only(top: 16, bottom: 12, left: 24, right: 24),
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
              Row(
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
              SizedBox(
                height: 12,
              ),
              for (String text in tab_list)
                GestureDetector(
                  onTap: () {
                    context.read<Page_Controller>().Drop_Down_kor(text);
                    if (text == '최신순') {
                      context.read<Page_Controller>().Drop_Down('update');
                    } else if (text == '조회순') {
                      context.read<Page_Controller>().Drop_Down('view_num');
                    } else if (text == '좋아요순') {
                      context.read<Page_Controller>().Drop_Down('like_num');
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: text == tab_list[tab_list.length - 1]
                              ? Color(0xffFFFFFF)
                              : Color(0xFFE6E6E6),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            color: Color(0xFF020202),
                            fontSize: 15,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        context.read<Page_Controller>().filter_text_kor == text
                            ? SvgPicture.asset(
                                'assets/icons/check.svg',
                                width: 16,
                                height: 16,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
