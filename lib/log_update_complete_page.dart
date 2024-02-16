import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/log_mywriten_page.dart';
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
  late Map<String, dynamic> _record = {};
  late String baseUrl =
      'https://iooykz0o87.execute-api.ap-northeast-2.amazonaws.com/api/files/g125rr5po70z7g5/${widget.logId}/';
  String? imagePath;
  String? fullImageUrl;
  final pb =
      PocketBase('https://iooykz0o87.execute-api.ap-northeast-2.amazonaws.com');
  late List<Map<String, dynamic>>? _myCareerList = [];
  late List<Map<String, dynamic>>? _myWorkList = [];
  TextEditingController tagEditingController = TextEditingController();
  List<String> displayTexts = [];
  @override
  void initState() {
    super.initState();
  }

  Future<List<Map<String, dynamic>>> _loadMyWorkList(
      List<String> workIds) async {
    List<Map<String, dynamic>> myWorkList = [];

    for (String id in workIds) {
      final workModel = await pb.collection('log_mywork').getOne(id);
      myWorkList.add(workModel.toJson());
    }

    return myWorkList;
  }

  Future<Map<String, dynamic>> _loadData() async {
    try {
      final user_id = context.read<User_Data>().record.record!.id;
      final recordModel =
          await pb.collection('log').getOne(widget.logId, expand: 'mywork');

      _record = recordModel.toJson() ?? {};
      imagePath = _record['image'];
      fullImageUrl =
          imagePath != null ? Uri.parse('$baseUrl$imagePath').toString() : null;

      _myCareerList =
          List<Map<String, dynamic>>.from(_record['mycareer'] ?? []);
      List<String> myWorkIds = List<String>.from(_record['mywork'] ?? []);
      _myWorkList = await _loadMyWorkList(myWorkIds);

      return _record;
    } catch (e) {
      print('데이터 로딩 중 오류: $e');
      throw e;
    }
  }

  Future<void> updateLog() async {
    final body = <String, dynamic>{
      "tag": displayTexts,
    };
    final record = await pb.collection('log').update(widget.logId, body: body);
    print(record);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LogMyWritenPage(logId: widget.logId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Color(0xFFF8F8F9),
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
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () {
                  updateLog();
                },
                child: Text(
                  "등록",
                  style: TextStyle(
                    color: Color(0xFF7F7F7F),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FutureBuilder<Map<String, dynamic>>(
              future: _loadData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // 데이터 로딩 중
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // 에러 발생
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Column(
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
                            onTap: () {
                              print(_myWorkList!.length);
                            },
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
                            color: Color(0xFF0059FF),
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
                          fullImageUrl != null
                              ? Container(
                                  width: 159,
                                  height: 199,
                                  child: Image.network(
                                    fullImageUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : CircularProgressIndicator(),
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
                                    '안녕하세요! ${_record['name']}입니다.',
                                    style: TextStyle(
                                      color: Color(0xFF020202),
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
                                    '${_record['content']}',
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
                        children: _myCareerList!.map((career) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    career['date']
                                        .split(' ~ ')[0]
                                        .split('년')[0],
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
                      Container(
                        height: _calculateGridViewHeight(_myWorkList!.length),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _myWorkList!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            Map<String, dynamic> workData = _myWorkList![index];

                            // Check if 'image' key exists and it is not null

                            return LogCardHalfWidget(
                              id: workData["id"],
                              thumbnail: workData['image'] != null
                                  ? workData['image'][0]
                                  : '',
                              tag: workData["tag"],
                              title: workData['name'],
                              date: workData['date'],
                            );
                          },
                        ),
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
                                color: Color(0xFF020202),
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
                                color: Color(0xFF020202),
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
                            width: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _record['mysns'].map<Widget>((sns) {
                                String snsText = '';

                                if (sns.contains('github')) {
                                  snsText = 'GitHub';
                                } else if (sns.contains('instagram')) {
                                  snsText = 'Instagram';
                                } else if (sns.contains('twitter')) {
                                  snsText = 'Twitter';
                                } else {
                                  snsText = 'Email';
                                }

                                return Column(
                                  children: [
                                    Text(
                                      snsText,
                                      style: TextStyle(
                                        color: Color(0xFF020202),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            width: 22,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _record['mysns'].map<Widget>((sns) {
                              return Column(
                                children: [
                                  Text(
                                    sns,
                                    style: TextStyle(
                                      color: Color(0xFF7F7F7F),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
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
                        width: 328,
                        height: 44,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF3F3F3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Align(
                          // 또는 Center 사용 가능
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: TextField(
                              controller: tagEditingController,
                              onSubmitted: (text) {
                                // 엔터를 눌렀을 때 실행할 동작
                                displayText(text);
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(top: 8, bottom: 16),
                                hintText: '#태그를 입력해주세요',
                                hintStyle: TextStyle(
                                  color: Color(0xFFB3B3B3),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: displayTexts.map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: ShapeDecoration(
                              color: Color(0xFFE5EEFF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  tag, // 수정된 부분
                                  style: TextStyle(
                                    color: Color(0xFF0059FF),
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      displayTexts.remove(tag); // 수정된 부분
                                    });
                                  },
                                  child: Icon(Icons.clear,
                                      color: Color(0xFF0059FF), size: 20.0),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 31.5,
                      )
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void displayText(String text) {
    // 정규 표현식을 사용하여 해시태그 추출
    RegExp exp = RegExp(r'\#\S+');
    Iterable<RegExpMatch> matches = exp.allMatches(text);

    // 추출된 해시태그를 리스트에 추가
    List<String> hashtags = [];
    for (RegExpMatch match in matches) {
      String hashtag = match.group(0)!;
      hashtags.add(hashtag.replaceAll('#', ''));
    }

    // 리스트를 displayTexts에 추가
    setState(() {
      displayTexts.addAll(hashtags);
      print(displayTexts);
    });

    // 텍스트 필드 초기화
    tagEditingController.clear();

    // 디버깅을 위한 출력
    print('text: $text');
    print('hashtags: $hashtags');
    print('displayTexts: $displayTexts');
  }
}

double _calculateGridViewHeight(int itemCount) {
  const double itemHeight = 200.0;
  const double spacing = 8.0;
  const int itemsPerRow = 2;

  // 계산식: (itemHeight * rows) + (spacing * (rows - 1))
  int rows = (itemCount / itemsPerRow).ceil();
  return (itemHeight * rows) + (spacing * (rows - 1));
}
