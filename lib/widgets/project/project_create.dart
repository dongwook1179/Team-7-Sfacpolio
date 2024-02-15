import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/project/projcet_calendar_select.dart';
import 'package:team_7_sfacpolio/widgets/project/project_create_Language_slot.dart';
import 'package:team_7_sfacpolio/widgets/project/project_create_appbar.dart';
import 'package:team_7_sfacpolio/widgets/project/project_create_period_select.dart';
import 'package:team_7_sfacpolio/widgets/project/project_create_type_slot.dart';
import 'package:team_7_sfacpolio/widgets/project/title_text.dart';

class Project_Create extends StatefulWidget {
  const Project_Create({super.key});

  @override
  State<Project_Create> createState() => _Project_CreateState();
}

class _Project_CreateState extends State<Project_Create> {
  Map<String, Widget> language = {};
  Map<String, Widget> field = {};
  int field_num = 0;
  int language_num = 0;
  List<String> more = ['사용하는 언어/프로그램', '관심 업종', 'MBTI', '경력'];
  Map<String, bool> more_active = {};
  String date = '';
  int period = 0;
  BoxDecoration boxdeco = BoxDecoration(
    border: Border.all(width: 1, color: Color(0xFFCCCCCC)),
    borderRadius: BorderRadius.circular(8),
  );

  TextStyle textst = TextStyle(
    color: Color(0xFF999999),
    fontSize: 14,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w400,
  );

  bool onbut = false;
  bool offbut = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (String text in more) {
      more_active[text] = false;
    }
  }

  void Field_widget(int index) {
    String key = 'slot_$index';
    Widget widget_build = Container(
      margin: EdgeInsets.only(top: 8),
      width: 328,
      child: Row(
        children: [
          Project_Create_Type_Slot(),
          SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                field.remove(key);
              });
              context
                  .read<Page_Controller>()
                  .project_create['develop_type']
                  .removeAt(index + 1);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Color(0xFF0059FF),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  '삭제',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
    field[key] = widget_build;
  }

  void Language_Widget(int index) {
    String key = 'slot_$index';
    Widget build_widget = Container(
      width: 328,
      height: 45,
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Project_Create_Language_Slot(),
          SizedBox(
            width: 4,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                language.remove(key);
              });
              context
                  .read<Page_Controller>()
                  .project_create['language']
                  .removeAt(index + 1);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xFF0059FF)),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  '삭제',
                  style: TextStyle(
                    color: Color(0xFF0059FF),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
    language[key] = build_widget;
    print(language);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Project_Create_Appbar(),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: IntrinsicHeight(
          child: Container(
            width: 360,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title_Text('프로젝트명', true),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: boxdeco,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 3),
                      child: TextField(
                        onChanged: (value) {
                          context
                              .read<Page_Controller>()
                              .Input_Project_info('else', 'title', value);
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '프로젝트 제목을 입력해주세요.',
                            hintStyle: textst),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Title_Text('모집 분야', true),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Field_widget(field_num);
                            field_num++;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/plus.svg',
                          width: 18,
                          height: 18,
                          color: Color(0xff0059FF),
                        ),
                      )
                    ],
                  ),
                  IntrinsicHeight(
                    child: Container(
                      padding: EdgeInsets.only(top: 8),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Project_Create_Type_Slot(),
                          for (String key in field.keys) field[key]!,
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Title_Text('사용 언어', true),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Language_Widget(language_num);
                            language_num++;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/plus.svg',
                          width: 18,
                          height: 18,
                          color: Color(0xff0059FF),
                        ),
                      )
                    ],
                  ),
                  IntrinsicHeight(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Project_Create_Language_Slot(),
                          for (String key in language.keys) language[key]!,
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Title_Text('시작 예정일', true),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final formatter = DateFormat('yyyy.MM.dd');
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Project_Calendar_Select();
                        },
                      ).then((value) => setState(() {
                            date = formatter.format(value);
                            context.read<Page_Controller>().Input_Project_info(
                                'else', 'start_time', value);
                          }));
                      print(date);
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      decoration: boxdeco,
                      child: Row(
                        children: [
                          date != ''
                              ? Text(
                                  date,
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              : Text('시작 예정일 선택', style: textst),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/icons/calendar.svg',
                            width: 16,
                            height: 16,
                            color: Color(0xff12131A),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Title_Text('예정 기간', true),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Project_Create_Period_Select(period);
                        },
                      ).then((value) => setState(() {
                            period = value;
                          }));
                      context
                          .read<Page_Controller>()
                          .Input_Project_info('else', 'period', period);
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      decoration: boxdeco,
                      child: Row(
                        children: [
                          period != 0
                              ? Text(
                                  '${period}개월',
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              : Text('선택', style: textst),
                          Spacer(),
                          SvgPicture.asset(
                            'assets/icons/chevron-down.svg',
                            width: 16,
                            height: 16,
                            color: Color(0xff333333),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Title_Text('진행방식', true),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              onbut = true;
                              offbut = false;
                            });
                            context
                                .read<Page_Controller>()
                                .Input_Project_info('else', 'type', '온라인');
                          },
                          child: Container(
                            width: 161,
                            height: 40,
                            decoration: onbut
                                ? BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Color(0xFF0059FF)),
                                    borderRadius: BorderRadius.circular(8),
                                  )
                                : boxdeco,
                            child: Center(
                              child: Text('온라인',
                                  style: onbut
                                      ? TextStyle(
                                          color: Color(0xFF0059FF),
                                          fontSize: 14,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                        )
                                      : textst),
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              offbut = true;
                              onbut = false;
                            });
                            context
                                .read<Page_Controller>()
                                .Input_Project_info('else', 'type', '오프라인');
                          },
                          child: Container(
                            width: 161,
                            height: 40,
                            decoration: offbut
                                ? BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Color(0xFF0059FF)),
                                    borderRadius: BorderRadius.circular(8),
                                  )
                                : boxdeco,
                            child: Center(
                              child: Text('오프라인',
                                  style: offbut
                                      ? TextStyle(
                                          color: Color(0xFF0059FF),
                                          fontSize: 14,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                        )
                                      : textst),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Title_Text('프로젝트 설명', true),
                  Container(
                    height: 270,
                    margin: EdgeInsets.only(top: 8),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: boxdeco,
                    child: TextField(
                      onChanged: (value) {
                        context
                            .read<Page_Controller>()
                            .Input_Project_info('else', 'content', value);
                      },
                      decoration: InputDecoration(
                          hintText: '프로젝트에 대한 설명을 작성해주세요.',
                          hintStyle: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none),
                      maxLines: null,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Title_Text('더 알고싶은 내용', false),
                  Text(
                    '지원자에게서 더 알고 싶은 내용을 선택해주세요.',
                    style: textst,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      for (String text in more)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              more_active[text] = !more_active[text]!;
                            });
                          },
                          child: IntrinsicWidth(
                            child: Container(
                              height: 32,
                              margin: EdgeInsets.only(right: 6),
                              decoration: more_active[text]!
                                  ? BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Color(0xFF0059FF)),
                                      borderRadius: BorderRadius.circular(8),
                                    )
                                  : boxdeco,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                child: Text(
                                  text,
                                  style: TextStyle(
                                    color: more_active[text]!
                                        ? Color(0xFF0059FF)
                                        : Color(0xFF7F7F7F),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
