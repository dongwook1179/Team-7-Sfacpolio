import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/search/search_button.dart';
import 'package:team_7_sfacpolio/widgets/search/search_tag_slot.dart';

class Search_Bottom_Sheet extends StatefulWidget {
  const Search_Bottom_Sheet({super.key});

  @override
  State<Search_Bottom_Sheet> createState() => _Search_Bottom_SheetState();
}

class _Search_Bottom_SheetState extends State<Search_Bottom_Sheet> {
  List<String> type = ['제목', '내용', '작성자', '댓글'];
  List<String> category = ['LOG', '커뮤니티', '프로젝트', '내 게시물'];
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Page_Controller>(
      builder: (context, pageController, _) {
        return SingleChildScrollView(
          child: IntrinsicHeight(
            child: Container(
              width: 360,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
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
                  Row(
                    children: [
                      for (String text in type) Search_Button(text, 'type')
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    '카테고리',
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
                  Row(
                    children: [
                      for (String text in category)
                        Search_Button(text, 'category')
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    '태그',
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
                  Container(
                    width: 328,
                    height: 44,
                    child: TextField(
                      controller: textEditingController,
                      onEditingComplete: () {
                        String text = textEditingController.text;
                        textEditingController.text = '';
                        if (text.length != 0) {
                          context
                              .read<Page_Controller>()
                              .Search_Input_Tag(text);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: '#태그를 입력해주세요',
                        hintStyle: TextStyle(
                          color: Color(0xFFB3B3B3),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        filled: true,
                        fillColor: Color(0xFFF3F3F3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children: [
                        for (String text
                            in context.read<Page_Controller>().tag_list)
                          Search_Tag_Slot(text)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<Page_Controller>().Reset_Filter();
                            print('클릭');
                          },
                          child: Container(
                            width: 144,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xFFCCCCCC),
                                ),
                                color: Color(0xffffffff)),
                            child: Center(
                              child: Text(
                                '초기화',
                                style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () async {
                            Map<String, dynamic> condition = {};
                            condition['tag'] = [];
                            for (String tag
                                in context.read<Page_Controller>().tag_list) {
                              condition['tag'].add(tag);
                            }
                            for (String type in (context
                                    .read<Page_Controller>()
                                    .filter['type'] ??
                                [])) {
                              condition[type] = true;
                            }
                            for (String catagory in (context
                                    .read<Page_Controller>()
                                    .filter['category'] ??
                                [])) {
                              condition[catagory] = true;
                            }
                            String text =
                                context.read<Page_Controller>().search;
                            Map<String, dynamic> filter_data =
                                await PocketBaseData()
                                    .Data_Filter(text, condition);
                            print('필터 --------------------');
                            print(filter_data);
                            print('필터 --------------------');
                            context
                                .read<Page_Controller>()
                                .Get_Data(filter_data);
                          },
                          child: Container(
                            width: 144,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF0059FF)),
                            child: Center(
                              child: Text(
                                '적용',
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
