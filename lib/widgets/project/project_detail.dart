import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/common/bottom_nav_bar.dart';
import 'package:team_7_sfacpolio/widgets/project/project_applicant.dart';
import 'package:team_7_sfacpolio/widgets/project/project_deadline.dart';
import 'package:team_7_sfacpolio/widgets/project/project_detail_appbar.dart';
import 'package:team_7_sfacpolio/widgets/project/project_detail_recruit.dart';

class Project_Detail extends StatefulWidget {
  final dynamic data;

  const Project_Detail(this.data);

  @override
  State<Project_Detail> createState() => _Project_DetailState();
}

class _Project_DetailState extends State<Project_Detail> {
  String date = '';

  void Date_Division() {
    DateTime dateTime = DateTime.parse(widget.data.data['start_time']);
    String formattedDate =
        "${dateTime.year}.${_twoDigits(dateTime.month)}.${_twoDigits(dateTime.day)}";

    setState(() {
      date = formattedDate;
    });
  }

  String _twoDigits(int n) {
    if (n >= 10) {
      return "$n";
    } else {
      return "0$n";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('체크용');
    print(widget.data.data.keys);
    Date_Division();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Project_Detail_Appbar('프로젝트'),
      ),
      body: IntrinsicHeight(
        child: Container(
          width: 360,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Project_DeadLine(widget.data.data['start_time']),
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.data.data['title'],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
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
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(widget.data.data['avatar']),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      widget.data.data['nickname'],
                      style: TextStyle(
                        color: Color(0xFF4C4C4C),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    widget.data.data['like'].contains(
                            context.read<User_Data>().record.record!.id)
                        ? Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/icons/Property 2=Outline, Property 3=heart, Property 4=active.svg',
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/icons/heart.svg',
                              color: Color(0xff999999),
                              fit: BoxFit.cover,
                            ),
                          ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFE6E6E6)))),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 31,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '모집 인원',
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: IntrinsicWidth(
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                children: [
                                  for (String key
                                      in widget.data.data['recruit'].keys)
                                    Project_Detail_Recruit(
                                        widget.data.data['recruit'][key])
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '사용 언어',
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: IntrinsicWidth(
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  spacing: 8,
                                  children: [
                                    for (Map<String, String> language
                                        in widget.data.data['language'])
                                      IntrinsicWidth(
                                        child: Container(
                                          height: 21,
                                          child: Row(
                                            children: [
                                              SvgPicture.network(
                                                language['logo']!,
                                                width: 20,
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                language['language']!,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: 'Pretendard',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                  ],
                                ))),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '시작 예정',
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '예상 기간',
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        '${widget.data.data['period']}개월',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '예상 기간',
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        widget.data.data['type'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFE6E6E6)))),
                ),
                IntrinsicHeight(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.data.data['content'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Project_Applicant(widget.data)));
                  },
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 14, vertical: 40),
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
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
