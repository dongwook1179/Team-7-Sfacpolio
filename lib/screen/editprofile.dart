import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/home_page.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_career.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_develop.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_language.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_mbti_select.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_project_period_select.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_service.dart';
import 'package:team_7_sfacpolio/widgets/project/title_text.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Map<String, dynamic> user = {};
  TextEditingController nickname = TextEditingController();
  TextEditingController spaclog = TextEditingController();
  TextEditingController introdution = TextEditingController();

  String project_type = '';
  String project_period = '';
  int career_create = 0;
  bool onbut = false;
  bool offbut = false;
  BoxDecoration boxdeco = BoxDecoration(
    border: Border.all(width: 1, color: Color(0xFFCCCCCC)),
    borderRadius: BorderRadius.circular(8),
  );

  TextStyle textstyle = TextStyle(
    color: Color(0xFF020202),
    fontSize: 14,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w400,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_Data();
  }

  void Get_Data() {
    context.read<User_Data>().Data_Delete();
    setState(() {
      user = context.read<User_Data>().user_data;
    });
    context.read<User_Data>().save_data['id'] = user['user'].id;
    if (user['user'].data['nickname'] != '') {
      context.read<User_Data>().Nickname_Save(user['user'].data['nickname']);
      nickname.text = user['user'].data['nickname'];
    }

    if (user['user'].data['introduction'] != '') {
      context
          .read<User_Data>()
          .Introduction_Save(user['user'].data['introduction']);
      introdution.text = user['user'].data['introduction'];
    }

    if (user['language'] != {}) {
      for (var data in user['language']) {
        setState(() {
          context.read<User_Data>().Language_Save(data['language']);
        });
      }
    }

    if (user['develop_type'] != {}) {
      for (var data in user['develop_type']) {
        setState(() {
          context.read<User_Data>().Develop_Save(data['develop_type']);
        });
      }
    }

    if (user['service'] != []) {
      for (var data in user['service']) {
        context.read<User_Data>().Service_Save(data['service']);
      }
    }
    if (user['career'] == null) {
      for (String key in user['career'].keys) {
        context.read<User_Data>().Career_Save({
          'id': Random().nextInt(1000).toString(),
          'type': user['career'][key]['type'],
          'company': user['career'][key]['company'],
          'period': user['career'][key]['period']
        });
      }
    } else {
      context.read<User_Data>().Career_Save({
        'id': Random().nextInt(1000).toString(),
        'type': '',
        'company': '',
        'period': '',
      });
    }

    if (user['user'].data['mbti'] != '') {
      setState(() {
        context.read<User_Data>().MBTI_Save(user['user'].data['mbti']);
      });
    }

    if (user['user'].data['preferred_project_period'] != '') {
      setState(() {
        project_period = user['user'].data['preferred_project_period'];
      });
    }
    if (user['user'].data['work_type'] != '') {
      setState(() {
        project_type = user['user'].data['work_type'];
        if (project_type == '온라인') {
          onbut = true;
        } else {
          offbut = true;
        }
      });
    }

    if (project_type != '' && project_period != '') {
      context.read<User_Data>().Project_Save({
        'work_type': project_type,
        'preferred_project_period': project_period
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<User_Data>(builder: (context, user_data, _) {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.navigate_before),
              ),
              title: Text(
                '내 프로필 편집',
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icon/search.svg'),
                )
              ]),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Container(
                width: 360,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Stack(clipBehavior: Clip.none, children: [
                            Image.asset(
                              'assets/images/service/Rectangle 12774.png',
                            ),
                            Positioned(
                              bottom: 0,
                              right: -3,
                              child: Container(
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border:
                                        Border.all(color: Color(0xFFE6E6E6)),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icon/camera.svg',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        Text(
                          '닉네임',
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
                        Container(
                          width: 328,
                          height: 45,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFCCCCCC)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            onChanged: (text) {
                              context.read<User_Data>().Nickname_Save(text);
                            },
                            controller: nickname,
                            style: textstyle,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '닉네임',
                                contentPadding: EdgeInsets.all(10)),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          '스펙로그 URL',
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
                        Row(
                          children: [
                            Container(
                                width: 82,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Color(0xFF0059FF),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8))),
                                child: Center(
                                  child: Text(
                                    'sfalog.kr/',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                )),
                            Container(
                              width: 246,
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFCCCCCC)),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '스펙로그 URL을 입력해주세요',
                                      contentPadding: EdgeInsets.all(8)),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          '소개',
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
                            width: 328,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xFFCCCCCC)),
                            ),
                            child: TextField(
                              maxLines: null,
                              onChanged: (value) {
                                context
                                    .read<User_Data>()
                                    .Introduction_Save(value);
                              },
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '간단한 자기소개를 입력해주세요',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF020202),
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  contentPadding: EdgeInsets.all(8)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Title_Text('개발 언어', false),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (!context
                                      .read<User_Data>()
                                      .save_data['language']
                                      .contains('')) {
                                    context.read<User_Data>().Language_Save('');
                                  }
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
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Column(children: [
                            if ((context
                                        .read<User_Data>()
                                        .save_data['language'] ??
                                    []) !=
                                [])
                              for (String text in context
                                  .watch<User_Data>()
                                  .save_data['language'])
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      context
                                                  .read<User_Data>()
                                                  .save_data['language']
                                                  .indexOf(text) >
                                              0
                                          ? Profile_Edit_Language(text, true)
                                          : Profile_Edit_Language(text, false),
                                    ],
                                  ),
                                )
                            else
                              Profile_Edit_Language('', false),
                          ]),
                        )),
                        Row(
                          children: [
                            Title_Text('개발 직군', false),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (!context
                                      .read<User_Data>()
                                      .save_data['develop_type']
                                      .contains('')) {
                                    context.read<User_Data>().Develop_Save('');
                                  }
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
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Column(children: [
                            if ((context
                                        .read<User_Data>()
                                        .save_data['develop_type'] ??
                                    []) !=
                                [])
                              for (String text in context
                                  .read<User_Data>()
                                  .save_data['develop_type'])
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      context
                                                  .read<User_Data>()
                                                  .save_data['develop_type']
                                                  .indexOf(text) >
                                              0
                                          ? Profile_Edit_Develop(text, true)
                                          : Profile_Edit_Develop(text, false),
                                    ],
                                  ),
                                )
                            else
                              Profile_Edit_Develop('', true),
                          ]),
                        )),
                        Row(
                          children: [
                            Title_Text('관심업종', false),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  context.read<User_Data>().Service_Save('');
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
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Column(children: [
                            if ((context
                                        .read<User_Data>()
                                        .save_data['service'] ??
                                    []) !=
                                [])
                              for (String text in context
                                  .read<User_Data>()
                                  .save_data['service'])
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      context
                                                  .read<User_Data>()
                                                  .save_data['service']
                                                  .indexOf(text) >
                                              0
                                          ? Profile_Edit_Service(text, true)
                                          : Profile_Edit_Service(text, false),
                                    ],
                                  ),
                                )
                            else
                              Profile_Edit_Service('', false),
                          ]),
                        )),
                        Title_Text('MBTI', false),
                        GestureDetector(
                          onTap: () async {
                            await showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return Profile_Edit_MBTI_Select(context
                                    .read<User_Data>()
                                    .save_data['mbti']);
                              },
                            ).then((value) => setState(() {
                                  context.read<User_Data>().MBTI_Save(value);
                                }));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 8),
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
                                context.read<User_Data>().save_data['mbti'] ==
                                        ''
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
                                            .read<User_Data>()
                                            .save_data['mbti'],
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
                        Row(
                          children: [
                            Title_Text('경력 사항', false),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                context.read<User_Data>().Career_Save({
                                  'id': Random().nextInt(1000).toString(),
                                  'type': '',
                                  'company': '',
                                  'period': '',
                                });
                                setState(() {
                                  print(career_create);
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
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Column(children: [
                            for (String key in context
                                .read<User_Data>()
                                .save_data['career']
                                .keys)
                              context
                                          .read<User_Data>()
                                          .save_data['career']
                                          .keys
                                          .toList()
                                          .indexOf(key) >
                                      0
                                  ? Profile_Edit_Career(
                                      context
                                          .read<User_Data>()
                                          .save_data['career'][key],
                                      true)
                                  : Profile_Edit_Career(
                                      context
                                          .read<User_Data>()
                                          .save_data['career'][key],
                                      false)
                          ]),
                        )),
                        SizedBox(
                          height: 16,
                        ),
                        Title_Text('프로젝트 선호 조건', false),
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
                                    project_type = '온라인';
                                  });
                                  if (project_type != '' &&
                                      project_period != '') {
                                    context.read<User_Data>().Project_Save({
                                      'work_type': project_type,
                                      'preferred_project_period': project_period
                                    });
                                  }
                                },
                                child: Container(
                                  width: 161,
                                  height: 40,
                                  decoration: onbut
                                      ? BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Color(0xFF0059FF)),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                            : textstyle),
                                  ),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    offbut = true;
                                    onbut = false;
                                    project_type = '오프라인';
                                  });
                                  if (project_type != '' &&
                                      project_period != '') {
                                    context.read<User_Data>().Project_Save({
                                      'work_type': project_type,
                                      'preferred_project_period': project_period
                                    });
                                  }
                                },
                                child: Container(
                                  width: 161,
                                  height: 40,
                                  decoration: offbut
                                      ? BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Color(0xFF0059FF)),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                            : textstyle),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return Profile_Edit_Project_Period_Select(
                                    project_period);
                              },
                            ).then((value) => setState(() {
                                  project_period = value;
                                }));
                            if (project_type != '' && project_period != '') {
                              context.read<User_Data>().Project_Save({
                                'work_type': project_type,
                                'preferred_project_period': project_period
                              });
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 8),
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
                                project_period == ''
                                    ? Text(
                                        '선호 기간 선택',
                                        style: TextStyle(
                                          color: Color(0xFF999999),
                                          fontSize: 14,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    : Text(
                                        project_period,
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

                        // Container(width: 360, height: 430, child: EditSearch()),
                        // Container(width: 360, height: 490, child: EditDropDown()),

                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () async {
                              bool update_state = await PocketBaseData()
                                  .User_Data_Update(
                                      context.read<User_Data>().save_data);
                              Map<String, dynamic> user_data =
                                  await PocketBaseData().Get_UserData(context
                                      .read<User_Data>()
                                      .record
                                      .record!
                                      .id);

                              Provider.of<User_Data>(context, listen: false)
                                  .Save_Auth(
                                      context.read<User_Data>().record,
                                      context.read<User_Data>().auth,
                                      user_data);
                              print(update_state);
                              if (update_state) {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF0059FF)),
                              child: Center(
                                child: Text(
                                  '저장',
                                  textAlign: TextAlign.center,
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
                        )
                      ]),
                ),
              ),
            ),
          ));
    });
  }
}
