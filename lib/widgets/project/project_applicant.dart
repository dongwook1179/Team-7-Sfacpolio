import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/common/bottom_nav_bar.dart';
import 'package:team_7_sfacpolio/widgets/project/project_applicant_mbti.dart';
import 'package:team_7_sfacpolio/widgets/project/project_applicant_type.dart';
import 'package:team_7_sfacpolio/widgets/project/project_applicant_use.dart';
import 'package:team_7_sfacpolio/widgets/project/project_detail_appbar.dart';

class Project_Applicant extends StatefulWidget {
  final dynamic data;
  const Project_Applicant(this.data);

  @override
  State<Project_Applicant> createState() => _Project_ApplicantState();
}

class _Project_ApplicantState extends State<Project_Applicant> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (context.read<User_Data>().record.record!.data['mbti'] != '') {
      context.read<Page_Controller>().Project_Change_Type(
          'mbti', context.read<User_Data>().record.record!.data['mbti']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Page_Controller>(
      builder: (context, pageController, _) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Project_Detail_Appbar('지원하기'),
          ),
          bottomNavigationBar: BottomNavBar(),
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
                      Text(
                        '지원 분야',
                        style: TextStyle(
                          color: Color(0xFF020202),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () async {
                          List<String> text_list = [];
                          for (String key in widget.data.data['recruit'].keys) {
                            String type =
                                widget.data.data['recruit'][key]['type'];
                            text_list.add(type);
                          }
                          await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Project_Applicant_Type(text_list);
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xFFCCCCCC),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              !context
                                      .read<Page_Controller>()
                                      .project_applicant_type
                                      .containsKey('type')
                                  ? Text(
                                      '선택',
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : Text(
                                      context
                                          .read<Page_Controller>()
                                          .project_applicant_type['type']!,
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                              Spacer(),
                              SvgPicture.asset(
                                'assets/icons/chevron-down.svg',
                                width: 16,
                                height: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        'MY 성향',
                        style: TextStyle(
                          color: Color(0xFF020202),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '사용하는 언어/프로그램',
                        style: TextStyle(
                          color: Color(0xFF4C4C4C),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Project_Applicant_Use();
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xFFCCCCCC),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              !context
                                      .read<Page_Controller>()
                                      .project_applicant_type
                                      .containsKey('language')
                                  ? Text(
                                      '선택',
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : Text(
                                      context
                                          .read<Page_Controller>()
                                          .project_applicant_type['language']!,
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                              Spacer(),
                              SvgPicture.asset(
                                'assets/icons/chevron-down.svg',
                                width: 16,
                                height: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'MBTI',
                        style: TextStyle(
                          color: Color(0xFF4C4C4C),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Project_Applicant_MBTI();
                            },
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xFFCCCCCC),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              !context
                                      .read<Page_Controller>()
                                      .project_applicant_type
                                      .containsKey('mbti')
                                  ? Text(
                                      '선택',
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : Text(
                                      context
                                          .read<Page_Controller>()
                                          .project_applicant_type['mbti']!,
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                              Spacer(),
                              SvgPicture.asset(
                                'assets/icons/chevron-down.svg',
                                width: 16,
                                height: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      Text(
                        '지원 사유',
                        style: TextStyle(
                          color: Color(0xFF020202),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      IntrinsicHeight(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0xFFCCCCCC)),
                              borderRadius: BorderRadius.circular(8)),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '프로젝트에 지원하게 된 사유를 작성해주세요.(200자 이내)',
                                hintStyle: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                counterText: '',
                                hintMaxLines: 2),
                            maxLines: null,
                            maxLength: 200,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xFF0059FF)),
                          child: Center(
                            child: Text(
                              '지원하기',
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
                      SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
