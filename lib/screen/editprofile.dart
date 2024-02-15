import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_career.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_develop.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_language.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_mbti_select.dart';
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
  List<String> language_text = [];
  List<String> develop_text = [];
  List<String> service_text = [];
  Map<String, dynamic> career = {};
  String mbti = '';
  int career_create = 0;

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
    setState(() {
      user = context.read<User_Data>().user_data;
    });
    if (user['user'].data['nickname'] != '') {
      nickname.text = user['user'].data['nickname'];
    }
    if (user['user'].data['introduction'] != '') {
      introdution.text = user['user'].data['introduction'];
    }
    if (user['language'] != {}) {
      for (var data in user['language']) {
        setState(() {
          language_text.add(data['language']);
        });
      }
    }
    if (user['develop_type'] != {}) {
      for (var data in user['develop_type']) {
        setState(() {
          develop_text.add(data['develop_type']);
        });
      }
    }
    if (user['service'] != {}) {
      for (var data in user['service']) {
        setState(() {
          service_text.add(data['service']);
        });
      }
    }

    if (user['career'] != {}) {
      for (var data in user['career']) {
        setState(() {
          career[data['id']] = {
            'type': data['type'],
            'company': data['company'],
            'period': data['period']
          };
        });
      }
    }
    if (user['user'].data['mbti'] != '') {
      setState(() {
        mbti = user['user'].data['mbti'];
      });
    }
    print(user['career']);
    print(career);
  }

  @override
  Widget build(BuildContext context) {
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
                                  border: Border.all(color: Color(0xFFE6E6E6)),
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
                                language_text.add('');
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
                          if (language_text != [])
                            for (String text in language_text)
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Profile_Edit_Language(text),
                                    language_text.indexOf(text) > 0
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                language_text.remove(text);
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 6),
                                              padding: EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF0059FF),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
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
                                        : Container()
                                  ],
                                ),
                              )
                          else
                            Profile_Edit_Language(''),
                        ]),
                      )),
                      Row(
                        children: [
                          Title_Text('개발 직군', false),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                develop_text.add('');
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
                          if (develop_text != [])
                            for (String text in develop_text)
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Profile_Edit_Develop(text),
                                    develop_text.indexOf(text) > 0
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                develop_text.remove(text);
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 6),
                                              padding: EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF0059FF),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
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
                                        : Container()
                                  ],
                                ),
                              )
                          else
                            Profile_Edit_Develop(''),
                        ]),
                      )),
                      Row(
                        children: [
                          Title_Text('관심업종', false),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                service_text.add('');
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
                          if (service_text != [])
                            for (String text in service_text)
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Profile_Edit_Service(text),
                                    service_text.indexOf(text) > 0
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                service_text.remove(text);
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 6),
                                              padding: EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF0059FF),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
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
                                        : Container()
                                  ],
                                ),
                              )
                          else
                            Profile_Edit_Service(''),
                        ]),
                      )),
                      Title_Text('MBTI', false),
                      GestureDetector(
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return Profile_Edit_MBTI_Select(mbti);
                            },
                          ).then((value) => setState(() {
                                mbti = value;
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
                              mbti == ''
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
                                      mbti,
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
                      Row(
                        children: [
                          Title_Text('경력 사항', false),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                career['slot_$career_create'] = {};
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
                          if (career != {})
                            for (String key in career.keys)
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Profile_Edit_Career(career[key]),
                                    career.keys.toList().indexOf(key) > 0
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                service_text.remove(key);
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 6),
                                              padding: EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF0059FF),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
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
                                        : Container()
                                  ],
                                ),
                              )
                          else
                            Profile_Edit_Career({}),
                        ]),
                      )),
                      // Container(width: 360, height: 430, child: EditSearch()),
                      // Container(width: 360, height: 490, child: EditDropDown()),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
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
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}
