import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';

class InfiniteScrollPage extends StatefulWidget {
  @override
  _InfiniteScrollPageState createState() => _InfiniteScrollPageState();
}

class _InfiniteScrollPageState extends State<InfiniteScrollPage> {
  List<Map<String, dynamic>> CommuityData = [];
  // List<String> items = List.generate(20, (index) => 'Item $index');
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  void _fetchData() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));
    Map<String, dynamic> newData = await PocketBaseData().Commuity();

    // List<String> newData =
    //     List.generate(10, (index) => 'New Item ${items.length + index}');
    // items.addAll(newData);

    setState(() {
      isLoading = false;
      CommuityData.add(newData);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: CommuityData.length + 1,
        itemBuilder: (context, index) {
          if (index < CommuityData.length) {
            Map<String, dynamic> data = CommuityData[index];
            return Container(
              color: Color(0xFFF8f8F9),
              child: Column(
                children: [
                  for (int i = 0; i < 5; i++)
                    Column(
                      children: [
                        Container(
                          width: 360,
                          height: 198,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      child: Image.asset(
                                        'assets/images/service/profile01.png',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      data[''] ?? '',
                                      style: TextStyle(
                                        color: Color(0xFF020202),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      // '• 디자이너',
                                      '• ${data[context.toString()] ?? null}',
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  // '프로젝트 설문조사 해주세요',
                                  data['project'] ?? '',
                                  style: TextStyle(
                                    color: Color(0xFF020202),
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 240,
                                      height: 36,
                                      child: Text(
                                        // '개발자 분들 설문조사 참여해주시면 추첨을 통하여 ~~드립니다.많은 참여 부탁드려요',
                                        data[''] ?? '',
                                        style: TextStyle(
                                            color: Color(0xFF4C4C4C),
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 72,
                                      height: 72,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/images/service/image 232.png',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Color(0xFFF6E5FF),
                                      ),
                                      child: Text(
                                        '자유',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF9946C0),
                                            fontSize: 11,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            height: 1.8),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 39,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Color(0xFFF6E5FF),
                                      ),
                                      child: Text(
                                        '백엔드',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF9946C0),
                                            fontSize: 11,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            height: 1.8),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 49,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Color(0xFFF6E5FF),
                                      ),
                                      child: Text(
                                        '디자이너',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF9946C0),
                                            fontSize: 11,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            height: 1.8),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 16,
                                      height: 16,
                                      child: SvgPicture.asset(
                                          'assets/icon/heart.svg'),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      '12',
                                      style: TextStyle(
                                        color: Color(0xFF7F7F7F),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 0.12,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Container(
                                        width: 16,
                                        height: 16,
                                        child: SvgPicture.asset(
                                            'assets/icons/chat-alt.svg')),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      '1',
                                      style: TextStyle(
                                        color: Color(0xFF7F7F7F),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 0.12,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Container(
                                        width: 16,
                                        height: 16,
                                        child: SvgPicture.asset(
                                            'assets/icons/eye.svg')),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      '239',
                                      style: TextStyle(
                                        color: Color(0xFF7F7F7F),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 0.12,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 166,
                                    ),
                                    Text(
                                      '3시간전',
                                      style: TextStyle(
                                        color: Color(0xFFB3B3B3),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 0.12,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: isLoading ? CircularProgressIndicator() : Text("Error"),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
