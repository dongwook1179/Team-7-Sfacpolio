import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/home_page.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/log/log_templete_card_half_widget.dart';

class LogMyWritenPage extends StatefulWidget {
  final String logId;
  const LogMyWritenPage({super.key, required this.logId});

  @override
  State<LogMyWritenPage> createState() => _LogMyWritenPageState();
}

class _LogMyWritenPageState extends State<LogMyWritenPage> {
  final pb =
      PocketBase('https://iooykz0o87.execute-api.ap-northeast-2.amazonaws.com');
  late Map<String, dynamic> _record = {};
  late Map<String, dynamic> user_Record = {};
  late Map<String, dynamic> develop_Record = {};
  late Map<String, dynamic> develop_type_Record = {};
  late String baseUrl =
      'https://iooykz0o87.execute-api.ap-northeast-2.amazonaws.com/api/files/g125rr5po70z7g5/${widget.logId}/';
  String? imagePath;
  String? fullImageUrl;
  late List<Map<String, dynamic>>? _myCareerList = [];
  late List<Map<String, dynamic>>? _myWorkList = [];
  List<dynamic> displayTexts = [];

  Future<Map<String, dynamic>> _loadData() async {
    try {
      final user_id = context.read<User_Data>().record.record!.id;
      final user_record = await pb.collection('users').getOne(user_id);
      print(user_record);
      final recordModel =
          await pb.collection('log').getOne(widget.logId, expand: 'mywork');
      final develop_record = await pb
          .collection('develop_type')
          .getList(filter: "user_id = '$user_id'");

      _record = recordModel.toJson() ?? {};
      user_Record = user_record.toJson() ?? {};
      develop_Record = develop_record.toJson() ?? {};
      imagePath = _record['image'];
      print(recordModel);
      displayTexts = _record["tag"];
      dynamic item = develop_record.items.first;
      Map<String, dynamic> itemMap = item.toJson();
      String firstDevelopTypeId = itemMap['develop_type_id'][0];

      final developtype = await pb.collection('develop_type_list').getOne(
            firstDevelopTypeId,
          );
      develop_type_Record = developtype.toJson() ?? {};

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

  Future<List<Map<String, dynamic>>> _loadMyWorkList(
      List<String> workIds) async {
    List<Map<String, dynamic>> myWorkList = [];

    for (String id in workIds) {
      final workModel = await pb.collection('log_mywork').getOne(id);
      myWorkList.add(workModel.toJson());
    }

    return myWorkList;
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
            '내가 쓴 LOG',
            style: TextStyle(
              color: Color(0xFF020202),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Text(
                  "확인",
                  style: TextStyle(
                    color: Color(0xFF7F7F7F),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
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
                          Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(34.29),
                                  ),
                                ),
                                child: Image.network(
                                    "https://iooykz0o87.execute-api.ap-northeast-2.amazonaws.com/api/files/_pb_users_auth_/${context.read<User_Data>().record.record!.id}/${user_Record["avatar"]}"),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                user_Record["nickname"],
                                style: TextStyle(
                                  color: Color(0xFF020202),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Container(
                                width: 2,
                                height: 2,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF0059FF),
                                  shape: OvalBorder(),
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                develop_type_Record["develop_type"],
                                style: TextStyle(
                                  color: Color(0xFF0059FF),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              print(_myWorkList!.length);
                            },
                            child: SvgPicture.asset(
                              "assets/icons/dots-vertical.svg",
                              color: Color(0xFF7F7F7F),
                              width: 22,
                              height: 22,
                            ),
                          ),
                        ],
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 159,
                                  child: Text(
                                    '안녕하세요! ${_record['name']}입니다.',
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
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/like.svg",
                            width: 16,
                            height: 16,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                              color: Color(0xFF7F7F7F),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            "assets/icons/comment.svg",
                            width: 16,
                            height: 16,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                              color: Color(0xFF7F7F7F),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            "assets/icons/view.svg",
                            width: 16,
                            height: 16,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "1",
                            style: TextStyle(
                              color: Color(0xFF7F7F7F),
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 328,
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
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
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
