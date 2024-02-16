import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:team_7_sfacpolio/widgets/mypage/mbti_detail.dart';

class MyPageList extends StatefulWidget {
  final Map<String, dynamic> data;
  const MyPageList(this.data);

  @override
  State<MyPageList> createState() => _MyPageListState();
}

class _MyPageListState extends State<MyPageList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data['career']);
  }

  String Period_Conversion(String period) {
    List<String> text_split = period.split(' ');
    String year = '';
    String month = '';

    print(text_split);
    for (String text in text_split) {
      if (text[text.length - 1] == '년') {
        if (text[0] != '0') {
          year = text;
        }
      } else {
        if (text[0] != '0') {
          month = text;
        }
      }
    }
    String return_string = '';
    if (year == '') {
      return_string = month;
    } else {
      '${year} ${month}';
    }

    return return_string;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 360,
              height: 70,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFFCFCFC),
                          border: Border.all(color: Color(0xFFE7E7E7))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          'assets/images/programing_logo/google.svg',
                        ),
                      )),
                  Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFFCFCFC),
                          border: Border.all(color: Color(0xFFE7E7E7))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          'assets/images/programing_logo/github.svg',
                        ),
                      )),
                  Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFFCFCFC),
                          border: Border.all(color: Color(0xFFE7E7E7))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          'assets/images/programing_logo/instagram.svg',
                        ),
                      )),
                  Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFFCFCFC),
                          border: Border.all(color: Color(0xFFE7E7E7))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset(
                          'assets/images/programing_logo/velog.png',
                        ),
                      )),
                  Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFFFCFCFC),
                          border: Border.all(color: Color(0xFFE7E7E7))),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          'assets/images/programing_logo/notion.svg',
                        ),
                      )),
                ],
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '소개',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.data['user'].data['introduction'] != ''
                          ? widget.data['user'].data['introduction']
                          : '',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '개발 언어',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    widget.data['language_key'] != null
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  for (String lan_data
                                      in widget.data['language_key'])
                                    IntrinsicWidth(
                                      child: Container(
                                        height: 70,
                                        margin: EdgeInsets.only(right: 8),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 7),
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFFB5B5B5)),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 32,
                                              height: 32,
                                              child: SvgPicture.asset(
                                                'assets/icons/icon_list_sXza12VDr4.svg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              lan_data,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          )
                        : widget.data['language'] != []
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (var lan_data
                                          in widget.data['language'])
                                        IntrinsicWidth(
                                          child: Container(
                                            height: 70,
                                            margin: EdgeInsets.only(right: 8),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 7),
                                            decoration: ShapeDecoration(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Color(0xFFB5B5B5)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 32,
                                                  height: 32,
                                                  child: SvgPicture.network(
                                                    lan_data['logo'],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  lan_data['language'],
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              )
                            : Container()
                  ],
                ),
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '개발 직군',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    widget.data['develop_type_key'] != null
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  for (String dev_data
                                      in widget.data['develop_type_key'])
                                    IntrinsicWidth(
                                      child: Container(
                                        height: 32,
                                        margin: EdgeInsets.only(right: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Color(0xFF0059FF),
                                            )),
                                        child: Center(
                                          child: Text(
                                            dev_data,
                                            style: TextStyle(
                                              color: Color(0xFF0059FF),
                                              fontSize: 12,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          )
                        : widget.data['develop_type'] != []
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: [
                                      for (var dev_data
                                          in widget.data['develop_type'])
                                        IntrinsicWidth(
                                          child: Container(
                                            height: 32,
                                            margin: EdgeInsets.only(right: 10),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 4),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Color(0xFF0059FF),
                                                )),
                                            child: Center(
                                              child: Text(
                                                dev_data['develop_type'],
                                                style: TextStyle(
                                                  color: Color(0xFF0059FF),
                                                  fontSize: 12,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                  ],
                ),
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            IntrinsicHeight(
              child: Container(
                color: Colors.white,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '관심업종',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        widget.data['service_key'] != null
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (String ser_data
                                          in widget.data['service_key'])
                                        Container(
                                            width: 41,
                                            height: 32,
                                            margin: EdgeInsets.only(right: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Color(0xFF0059FF),
                                                )),
                                            child: Center(
                                              child: Text(
                                                ser_data,
                                                style: TextStyle(
                                                  color: Color(0xFF0059FF),
                                                  fontSize: 12,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            )),
                                    ],
                                  ),
                                ),
                              )
                            : widget.data['service'] != []
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          for (var ser_data
                                              in widget.data['service'])
                                            Container(
                                                width: 41,
                                                height: 32,
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                      color: Color(0xFF0059FF),
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    ser_data['service'],
                                                    style: TextStyle(
                                                      color: Color(0xFF0059FF),
                                                      fontSize: 12,
                                                      fontFamily: 'Pretendard',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                )),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            IntrinsicHeight(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        child: Text(
                          'MBTI',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      (widget.data['user'].data['mbti'] ?? '') != ''
                          ? MbtiDetail(widget.data['user'].data['mbti'])
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '경력 사항',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    widget.data['career'] != []
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                for (String key in widget.data['career'].keys)
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Color(0xFFF3F3F3)))),
                                    child: Row(
                                      children: [
                                        widget.data['career'][key]['type'] ==
                                                'company'
                                            ? SvgPicture.asset(
                                                'assets/icons/briefcase.svg')
                                            : SvgPicture.asset(
                                                'assets/icons/academic-cap.svg'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              (widget.data['career'][key]
                                                      ['company'] ??
                                                  ''),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              Period_Conversion(
                                                  (widget.data['career'][key]
                                                          ['period'] ??
                                                      '')),
                                              style: TextStyle(
                                                color: Color(0xFF4C4C4C),
                                                fontSize: 12,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            Container(
              width: 360,
              height: 8,
              color: Color(0xFFF8f8F9),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '프로젝트 선호 조건',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        widget.data['user'].data['work_type'] != ''
                            ? Container(
                                width: 52,
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Color(0xFF0059FF),
                                    )),
                                child: Center(
                                  child: Text(
                                    widget.data['user'].data['work_type'],
                                    style: TextStyle(
                                      color: Color(0xFF0059FF),
                                      fontSize: 12,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ))
                            : Container(),
                        SizedBox(
                          width: 10,
                        ),
                        widget.data['user'].data['preferred_project_period'] !=
                                ''
                            ? Container(
                                width: 65,
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Color(0xFF0059FF),
                                    )),
                                child: Center(
                                  child: Text(
                                    widget.data['user']
                                        .data['preferred_project_period'],
                                    style: TextStyle(
                                      color: Color(0xFF0059FF),
                                      fontSize: 12,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ))
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
