import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/log_write_page.dart';
import 'package:team_7_sfacpolio/screen/search.dart';
import 'package:team_7_sfacpolio/widgets/log/log_card_widget.dart';
import 'package:team_7_sfacpolio/widgets/log/log_portfolio_widget.dart';

class MyPageLog extends StatefulWidget {
  const MyPageLog({super.key});

  @override
  State<MyPageLog> createState() => _MyPageLogState();
}

class _MyPageLogState extends State<MyPageLog>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

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
    tabController = TabController(
      length: 5,
      vsync: this,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                height: 391,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
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
              Container(
                height: 681,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                      child: PageView.builder(
                        itemCount: 9, // 페이지 수 지정
                        itemBuilder: (context, index) {
                          return Column(children: []);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
