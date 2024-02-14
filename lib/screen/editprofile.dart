import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/screen/editdropdown.dart';
import 'package:team_7_sfacpolio/screen/editsearch.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
        body: SingleChildScrollView(
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
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFCCCCCC)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '스펙왕_1212',
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
                            padding: const EdgeInsets.all(7.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: ' Happy_1212',
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
                    Container(
                      width: 328,
                      height: 82,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFCCCCCC)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                            child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: ''' 개발은 저에게 항상 즐겁고 재밌는 것입니다.
                                사용자에게 도움이 되는 서비스를 만들고 싶습니다.''',
                              hintStyle: TextStyle(
                                color: Color(0xFF020202),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                              contentPadding: EdgeInsets.all(8)),
                        )),
                      ),
                    ),
                    Container(width: 360, height: 430, child: EditSearch()),
                    Container(width: 360, height: 490, child: EditDropDown()),
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
        ));
  }
}
