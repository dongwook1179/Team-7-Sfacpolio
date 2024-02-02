import 'package:flutter/material.dart';

void main() {
  runApp(NoticePage());
}

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              '알림',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.2),
                fontSize: 18,
                fontFamily: 'Pretendard Variable',
                fontWeight: FontWeight.w600,
                height: 0.07,
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: '좋아요'),
                Tab(text: '프로젝트'),
                Tab(text: '채용'),
                Tab(text: '의견'),
              ],
              labelStyle: TextStyle(
                fontSize: 14,
                fontFamily: 'Pretendard Variable',
                fontWeight: FontWeight.w700,
              ),
              indicator: CustomTabIndicator(),
              labelColor: Colors.black, // 선택된 탭의 텍스트 색상
              unselectedLabelColor: Color(0xFFB3B3B3), // 선택되지 않은 탭의 텍스트 색상
            ),
          ),
          body: TabBarView(
            children: [
              // 좋아요 탭에 해당하는 위젯을 추가하세요.
              LikeTabContent(),
              // 나머지 탭에 해당하는 내용을 추가하세요.
              ProjectTapContent(),
              Container(
                child: Text('채용 탭 내용'),
              ),
              Container(
                child: Text('의견 탭 내용'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter(this, onChanged);
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomTabIndicatorPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final double indicatorWidth =
        configuration.size!.width + 20.0; // 커스텀 밑줄의 길이
    final double indicatorHeight = 3.0; // 커스텀 밑줄의 높이

    final Rect rect = Rect.fromCenter(
      center: Offset(
        offset.dx + (configuration.size!.width / 2),
        offset.dy + configuration.size!.height - (indicatorHeight / 2),
      ),
      width: indicatorWidth,
      height: indicatorHeight,
    );

    final Paint paint = Paint()
      ..color = Colors.black // 커스텀 밑줄의 색상
      ..strokeWidth = indicatorHeight // 커스텀 밑줄의 높이
      ..strokeCap = StrokeCap.square; // 직사각형 밑줄

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
      ),
      paint,
    );
  }
}

// 새로운 위젯을 만듭니다.
class LikeTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32, left: 19, right: 20),
      child: ListView(
        padding: EdgeInsets.only(bottom: 12),
        children: [
          ListTile(
            title: Row(
              children: [
                Container(
                  width: 15.5,
                  height: 15.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue, // 컨테이너의 색상
                  ),
                ),
                SizedBox(
                  width: 21,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kimgraphic님이 회원님의 작업에 좋아요를 눌렀습니다.",
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 16,
                          fontFamily: 'Pretendard Variable',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '-분전',
                        style: TextStyle(
                          color: Color(0xFFA0A0A0),
                          fontSize: 12,
                          fontFamily: 'Pretendard Variable',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  width: 15.5,
                  height: 15.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue, // 컨테이너의 색상
                  ),
                ),
                SizedBox(
                  width: 21,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kimgraphic님이 회원님의 작업에 좋아요를 눌렀습니다.",
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 16,
                          fontFamily: 'Pretendard Variable',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '-분전',
                        style: TextStyle(
                          color: Color(0xFFA0A0A0),
                          fontSize: 12,
                          fontFamily: 'Pretendard Variable',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  width: 15.5, // 예시로 40의 너비를 지정합니다. 필요에 따라 조절하세요.
                  height: 15.5, // 예시로 40의 높이를 지정합니다. 필요에 따라 조절하세요.
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC4C4C4), // 컨테이너의 색상
                  ),
                ),
                SizedBox(
                  width: 21,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kimgraphic님이 회원님의 작업에 좋아요를 눌렀습니다.",
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 16,
                          fontFamily: 'Pretendard Variable',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '-분전',
                        style: TextStyle(
                          color: Color(0xFFA0A0A0),
                          fontSize: 12,
                          fontFamily: 'Pretendard Variable',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  width: 15.5, // 예시로 40의 너비를 지정합니다. 필요에 따라 조절하세요.
                  height: 15.5, // 예시로 40의 높이를 지정합니다. 필요에 따라 조절하세요.
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC4C4C4), // 컨테이너의 색상
                  ),
                ),
                SizedBox(
                  width: 21,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kimgraphic님이 회원님의 작업에 좋아요를 눌렀습니다.",
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 16,
                          fontFamily: 'Pretendard Variable',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '-분전',
                        style: TextStyle(
                          color: Color(0xFFA0A0A0),
                          fontSize: 12,
                          fontFamily: 'Pretendard Variable',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectTapContent extends StatelessWidget {
  const ProjectTapContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32, left: 20),
      child: ListView(
        padding: EdgeInsets.only(bottom: 12),
        children: [
          ListTile(
            title: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC4C4C4),
                  ),
                ),
                SizedBox(
                  width: 21,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kimsgraphic',
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 14,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '메세지 내용입니다.',
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 14,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC4C4C4),
                  ),
                ),
                SizedBox(
                  width: 21,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kimsgraphic',
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 14,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '메세지 내용입니다.',
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 14,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC4C4C4),
                  ),
                ),
                SizedBox(
                  width: 21,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kimsgraphic',
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 14,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '메세지 내용입니다.',
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 14,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC4C4C4),
                  ),
                ),
                SizedBox(
                  width: 21,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kimsgraphic',
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 14,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '메세지 내용입니다.',
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 14,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC4C4C4),
                  ),
                ),
                SizedBox(
                  width: 21,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kimsgraphic',
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 14,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '메세지 내용입니다.',
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontSize: 14,
                        fontFamily: 'Pretendard Variable',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
