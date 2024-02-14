import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/log/log_templete_card_half_widget.dart';

class LogUpdateCompletePage extends StatefulWidget {
  final String logId;

  const LogUpdateCompletePage({required this.logId, Key? key})
      : super(key: key);

  @override
  _LogUpdateCompletePageState createState() => _LogUpdateCompletePageState();
}

class _LogUpdateCompletePageState extends State<LogUpdateCompletePage> {
  late Map<String, dynamic> _record; // 변경된 부분: _record로 이름 변경
  final pb = PocketBase('http://3.36.50.35:8090');
  late List<Map<String, dynamic>> _myCareerList;

  @override
  void initState() {
    super.initState();
    _myCareerList = [];
    _loadData();
  }

  Map<String, dynamic>? get record => _record;
  List<Map<String, dynamic>> get myCareerList => _myCareerList;
  Future<void> _loadData() async {
    try {
      print(widget.logId);
      final user_id = context.read<User_Data>().record.record!.id;
      final recordModel = await pb.collection('log').getOne(widget.logId);

      _record = recordModel.toJson(); // 변경된 부분: _record로 할당
      _myCareerList = List<Map<String, dynamic>>.from(_record['mycareer']);
      print("a = $recordModel");
      print("b = $_record"); // 변경된 부분: 사용 시 _record로 참조
      setState(() {});
    } catch (e) {
      print('데이터 로딩 중 오류: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              size: 16,
            ),
          ),
          title: Text(
            'LOG 쓰기',
            style: TextStyle(
              color: Color(0xFF020202),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 0.08,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '포트폴리오',
                      style: TextStyle(
                        color: Color(0xFFB3B3B3),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/icons/chevron-right.svg",
                        color: Color(0xFFB3B3B3),
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: 327,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFB3B3B3),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${Provider.of<User_Data>(context, listen: false).record.record!.data["nickname"]}\'\s Portfolio",
                    style: TextStyle(
                      color: Color(0xFF7F7F7F),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 159,
                      height: 199,
                      child: Image.network(
                        "${record!['image']}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 26),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 159,
                            child: Text(
                              '안녕하세요! ${record!['name']}입니다.',
                              style: TextStyle(
                                color: Color(0xFF7F7F7F),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: 159,
                            child: Text(
                              '${record!['content']}',
                              style: TextStyle(
                                color: Color(0xFF7F7F7F),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 159,
                  child: Text(
                    'About Me ',
                    style: TextStyle(
                      color: Color(0xFF7F7F7F),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: myCareerList.map((career) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              // Extracting year from date (e.g., "2014년 10월 30일 ~ 2015년 1월 30일")
                              career['date'].split(' ~ ')[0].split('년')[0],
                              style: TextStyle(
                                color: Color(0xFF7F7F7F),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            SizedBox(
                              child: Text(
                                career['project'],
                                style: TextStyle(
                                  color: Color(0xFF7F7F7F),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 159,
                  child: Text(
                    'My Work ',
                    style: TextStyle(
                      color: Color(0xFF7F7F7F),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LogCardHalfWidget(),
                    LogCardHalfWidget(),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LogCardHalfWidget(),
                    LogCardHalfWidget(),
                  ],
                ),
                SizedBox(
                  height: 20.5,
                ),
                Text(
                  'Contact Me ',
                  style: TextStyle(
                    color: Color(0xFF7F7F7F),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 38,
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 54,
                    ),
                    SizedBox(
                      child: Text(
                        _record["email"],
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 48,
                      child: Text(
                        'Phone',
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 44,
                    ),
                    SizedBox(
                      child: Text(
                        _record["phone"],
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 74,
                      child: Text(
                        'Instagram',
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    SizedBox(
                      child: Text(
                        '@speclog_1234',
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: Text(
                        'Twitter',
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 42,
                    ),
                    SizedBox(
                      child: Text(
                        '@speclog1234',
                        style: TextStyle(
                          color: Color(0xFF7F7F7F),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 327,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFB3B3B3),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
