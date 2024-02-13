import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/log_write_page.dart';
import 'package:team_7_sfacpolio/screen/search.dart';
import 'package:team_7_sfacpolio/widgets/common/bottom_nav_bar.dart';
import 'package:team_7_sfacpolio/widgets/log/log_card_widget.dart';
import 'package:team_7_sfacpolio/widgets/log/log_portfolio_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogMainPage(),
    );
  }
}

class LogMainPage extends StatefulWidget {
  const LogMainPage({super.key});

  @override
  State<LogMainPage> createState() => _LogMainPageState();
}

class _LogMainPageState extends State<LogMainPage>
    with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();
  PageController _pageController = PageController();
  late TabController tabController = TabController(
    length: 5,
    vsync: this,
    initialIndex: 0,

    /// 탭 변경 애니메이션 시간
    animationDuration: const Duration(milliseconds: 400),
  );
  int page_currentPage = 0;
  int _currentPage = 0;
  int _itemCount = 5;
  List<LogCardWidget> logCardDataList = [
    LogCardWidget(
      backgroundimage: AssetImage("assets/images/log/logcardbackground.png"),
      tag1: 'JAVA',
      tag2: 'Python',
      tag3: '',
      title: '개발자가 되기 위한 5일의 기록',
      logdate: DateTime.timestamp(),
      avatar: AssetImage("assets/images/log/log_card_avatar.png"),
      nickname: 'Master0332',
      view: 22,
      like: 999,
      comment: 550,
    ),
    LogCardWidget(
      backgroundimage: AssetImage("assets/images/log/logcardbackground.png"),
      tag1: 'JAVA',
      tag2: 'Python',
      tag3: '',
      title: '개발자가 되기 위한 5일의 기록',
      logdate: DateTime.timestamp(),
      avatar: AssetImage("assets/images/log/log_card_avatar.png"),
      nickname: 'Master0332',
      view: 22,
      like: 999,
      comment: 550,
    ),
    LogCardWidget(
      backgroundimage: AssetImage("assets/images/log/logcardbackground.png"),
      tag1: 'JAVA',
      tag2: 'Python',
      tag3: '',
      title: '개발자가 되기 위한 5일의 기록',
      logdate: DateTime.timestamp(),
      avatar: AssetImage("assets/images/log/log_card_avatar.png"),
      nickname: 'Master0332',
      view: 22,
      like: 999,
      comment: 550,
    ),
    LogCardWidget(
      backgroundimage: AssetImage("assets/images/log/logcardbackground.png"),
      tag1: 'JAVA',
      tag2: 'Python',
      tag3: '',
      title: '개발자가 되기 위한 5일의 기록',
      logdate: DateTime.timestamp(),
      avatar: AssetImage("assets/images/log/log_card_avatar.png"),
      nickname: 'Master0332',
      view: 22,
      like: 999,
      comment: 550,
    ),
    LogCardWidget(
      backgroundimage: AssetImage("assets/images/log/logcardbackground.png"),
      tag1: 'JAVA',
      tag2: 'Python',
      tag3: '',
      title: '개발자가 되기 위한 5일의 기록',
      logdate: DateTime.timestamp(),
      avatar: AssetImage("assets/images/log/log_card_avatar.png"),
      nickname: 'Master0332',
      view: 22,
      like: 999,
      comment: 550,
    ),
  ];
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 48.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogWritePage(),
                ),
              );
            },
            backgroundColor: Color(0xFF196AFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000),
                ),
              ),
              child: SvgPicture.asset(
                "assets/icons/pencil.svg",
                color: Colors.white,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: Text(
            'LOG',
            style: TextStyle(
              color: Color(0xFF020202),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 0.08,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                );
              },
              child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: SvgPicture.asset("assets/icons/search.svg")),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 328,
                  height: 142,
                  padding: EdgeInsets.only(top: 20, left: 16),
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/log/log_card.png"),
                        fit: BoxFit.cover),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 242,
                        child: SizedBox(
                          width: 242,
                          child: Text(
                            '오늘의 로그를 기록해 사람들과\n소통해 보세요!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 32,
                          width: 113,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/pencil-alt.svg",
                                color: Colors.white,
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                '로그 작성하기',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'TOP5 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: '로그⭐ ',
                          style: TextStyle(
                            color: Color(0xFF0059FF),
                            fontSize: 16,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 291,
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: logCardDataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      LogCardWidget logcardWidget = logCardDataList[index];
                      return LogCardWidget(
                          backgroundimage: logcardWidget.backgroundimage,
                          title: logcardWidget.title,
                          tag1: logcardWidget.tag1,
                          tag2: logcardWidget.tag2,
                          tag3: logcardWidget.tag3,
                          avatar: logcardWidget.avatar,
                          logdate: logcardWidget.logdate,
                          nickname: logcardWidget.nickname,
                          view: logcardWidget.view,
                          like: logcardWidget.like,
                          comment: logcardWidget.comment);
                    },
                  ),
                ),
                DotsIndicator(
                  pageCount: _itemCount, // Replace with your actual item count
                  currentPage: _currentPage,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '로그를 더 둘러볼까요?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 328,
                  height: 27,
                  child: TabBar(
                    labelPadding: EdgeInsets.only(bottom: 5),
                    controller: tabController,
                    dividerHeight: 0,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 0.0, color: Colors.black),
                    ),
                    unselectedLabelStyle: TextStyle(
                      // 선택되지 않은 탭의 글자 스타일
                      color: Color(0xFFB3B3B3),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Pretendard',
                    ),
                    labelStyle: TextStyle(
                      // 선택된 탭의 글자 스타일
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                    tabs: const [
                      Tab(
                        child: Text(
                          '포트폴리오',
                          maxLines: 1,
                        ),
                      ),
                      Tab(
                        child: Text(
                          '프로젝트',
                        ),
                      ),
                      Tab(
                        child: Text(
                          '개발 학습',
                        ),
                      ),
                      Tab(
                        child: Text(
                          '아이디어',
                        ),
                      ),
                      Tab(
                        child: Text(
                          '대회',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 681,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        child: PageView.builder(
                          controller: _controller,
                          itemCount: 9, // 페이지 수 지정
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '필터 검색',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        SvgPicture.asset(
                                          "assets/icons/filter-a.svg",
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '인기순',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          "assets/icons/chevron-down.svg",
                                          width: 16,
                                          height: 16,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                LogportfolioWidget(
                                  title: '2023년 개발자의 회고',
                                  content:
                                      '로그 내용 적는 부분 이번 코딩 강좌에서는 구글 애널리틱스가 무엇인지 살펴보고 웹사이트에 연결하는 방법을 알아볼게요. 디자인베이스 강좌는 맥을 기준으로 해서 윈도우 사용자와 일 부 차이가 있을 수 있습니다. 이번 코딩 강좌에서는 구글 애널리틱스가 무엇인지 살펴보고 웹사이트에 연결하는 방법을 알아볼게요. 디자인베이스 강좌는 맥을 기준으로 해서 윈도우 사용자와 일부 차이가 있을 수 있습니다.',
                                  avatar: AssetImage(
                                      "assets/images/log/log_card_avatar.png"),
                                  nickname: 'qwerd4578',
                                  tag1: "백엔드",
                                  tag2: "코딩",
                                  tag3: "JAVA",
                                ),
                                Divider(height: 1, color: Color(0xFFE6E6E6)),
                                LogportfolioWidget(
                                  title: '2023년 AI 트랜드',
                                  content:
                                      'AI가 점점 발전하고 있는 요즘 시대, 2023년의 AI는 어떻게 발전하고 있을까요? 요즘 시대의 AI는 하는 방법을 알아볼게요. 디자인베이스 강좌는 맥을 기준으로 해서 윈도우 사용자와 일 부 차이가 있을 수 있습니다. 이번 코딩 강좌에서는 구글 애널리틱스가 무엇인지 살펴보고 웹사이트에 연결하는 방법을 알아볼게요. 디자인베이스 강좌는 맥을 기준으로 해서 윈도우 사용자와 일부 차이가 있을 수 있습니다.',
                                  avatar: null,
                                  thumbnail: AssetImage(
                                      "assets/images/main/img_log.png"),
                                  nickname: 'sfacdev',
                                  tag1: "프론트엔드",
                                  tag2: "HTML",
                                  tag3: "CSS",
                                  tag4: "JavaScript",
                                ),
                                Divider(height: 1, color: Color(0xFFE6E6E6)),
                                LogportfolioWidget(
                                  title: '',
                                  content: '',
                                  avatar: null,
                                  nickname: '',
                                ),
                                Divider(height: 1, color: Color(0xFFE6E6E6)),
                                LogportfolioWidget(
                                  title: '',
                                  content: '',
                                  avatar: null,
                                  nickname: '',
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 44),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        child:
                                            Icon(Icons.chevron_left, size: 14),
                                        onTap: () {
                                          if (_currentPage > 0) {
                                            _controller.previousPage(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          }
                                        },
                                      ),
                                      Row(
                                        children: List.generate(7, (index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                _controller
                                                    .jumpToPage(index + 1);
                                                print("여긴 ${index + 1}페이지야");
                                              },
                                              child: Text(
                                                (index + 1).toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: _currentPage == index
                                                      ? Color(0xFF0059FF)
                                                      : Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.chevron_right,
                                          size: 14,
                                        ),
                                        onTap: () {
                                          if (_currentPage < 6) {
                                            _controller.nextPage(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                          onPageChanged: (index) {
                            setState(() {
                              page_currentPage = index;
                            });
                          },
                        ),
                      ),
                      Container(
                        child: const Text('프로젝트 내용'),
                      ),
                      Container(
                        child: const Text('개발 학습 내용'),
                      ),
                      Container(
                        child: const Text('아이디어 내용'),
                      ),
                      Container(
                        child: const Text('대회 내용'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DotsIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  DotsIndicator({required this.pageCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 29, left: 4, right: 4),
          child: index == currentPage
              ? Container(
                  width: 22,
                  height: 6,
                  decoration: ShapeDecoration(
                    color: Color(0xFF0059FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              : Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == currentPage
                        ? Color(0xFF0059FF)
                        : Color(0xFFCCCCCC),
                  ),
                ),
        );
      }),
    );
  }
}

class CardData {
  final AssetImage backgroundimage;
  final String? title;
  final String? subtitle;

  CardData({
    this.title,
    this.subtitle,
    required this.backgroundimage,
  });
}
