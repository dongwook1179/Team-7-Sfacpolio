import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/dropdown.dart';
import 'package:team_7_sfacpolio/widgets/search/data_slot.dart';
import 'package:team_7_sfacpolio/widgets/search/search_appbar.dart';
import 'package:team_7_sfacpolio/widgets/search/search_button.dart';
import 'package:team_7_sfacpolio/widgets/search/search_filter_but.dart';
import 'package:team_7_sfacpolio/widgets/search/search_textfield.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> type = ['제목', '내용', '작성자', '댓글'];
  List<String> category = ['LOG', '커뮤니티', '프로젝트', '내 게시물'];

  @override
  Widget build(BuildContext context) {
    return Consumer<Page_Controller>(
      builder: (context, pageController, _) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 46),
              child: Column(
                children: [
                  Search_Appbar(),
                  SizedBox(
                    height: 12,
                  ),
                  Search_Textfield(),
                  context.read<Page_Controller>().search != ''
                      ? Container(
                          width: 360,
                          margin: EdgeInsets.only(top: 20, bottom: 8),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Search_Filter_button(),
                                for (String text in type)
                                  Search_Button(text, 'type'),
                                for (String text in category)
                                  Search_Button(text, 'category')
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  context.read<Page_Controller>().get_data_search.isNotEmpty
                      ? Container(
                          padding: EdgeInsets.only(left: 16, right: 8),
                          child: Row(
                            children: [
                              Text(
                                '${context.read<Page_Controller>().get_data_search.length}',
                                style: TextStyle(
                                  color: Color(0xFF0059FF),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '개의 결과',
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              DropDown()
                            ],
                          ),
                        )
                      : Container(),
                  context.read<Page_Controller>().get_data_search.isNotEmpty
                      ? IntrinsicHeight(
                          child: Container(
                            width: 360,
                            margin: EdgeInsets.only(top: 12),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  for (var data in context
                                      .read<Page_Controller>()
                                      .get_data_search
                                      .values)
                                    Data_Slot(Map<String, dynamic>.from(data))
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
