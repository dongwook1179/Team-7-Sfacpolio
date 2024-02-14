import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/screen/search.dart';
import 'package:team_7_sfacpolio/widgets/community/community_portfolio_widget.dart';
import 'package:team_7_sfacpolio/widgets/log/log_portfolio_widget.dart';
import 'package:team_7_sfacpolio/widgets/main/main_banner_widget.dart';
import 'package:team_7_sfacpolio/widgets/main/main_program_card_widget.dart';
import 'package:team_7_sfacpolio/widgets/main/main_project_card_widget.dart';
import 'package:team_7_sfacpolio/widgets/text_point.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool page_load = false;
  int program_currentPage = 0;
  int program_itemCount = 4;
  PageController program_pageController = PageController();
  List<ProgramData> programDataList = [
    ProgramData(
      backgroundimage: AssetImage("assets/images/main/img_edu1.png"),
      content: '개발자가 되려면\n꼭 알아야할 기본 지식 BEST4',
      tag1: "소프트웨어 테스트",
      tag2: "아키텍처",
      tag3: "Git",
      tag4: "Python",
    ),
    ProgramData(
      backgroundimage: AssetImage("assets/images/main/img_edu2.png"),
      content: '최신 빅데이터\n및 인공지능 트렌드 이해',
      tag1: "빅데이터",
      tag2: "인공지능(AI)",
    ),
    ProgramData(
      backgroundimage: AssetImage("assets/images/main/img_edu3.png"),
      content: '백엔드 개발자 취업 토탈 가이드\n(back-end. 멘토링 경험 기반',
      tag1: "백엔드",
      tag2: "포트폴리오",
      tag3: "기술면접",
      tag4: "이력서",
    ),
    ProgramData(
      backgroundimage: AssetImage("assets/images/main/img_edu4.png"),
      content: '게임 프로그래머 입문 올인원\nC++ & 자료구조 / 알고리즘 & 게임 서버',
      tag1: "C++",
      tag2: "게임 수학",
      tag3: "네트워크",
      tag4: "Window-api",
    ),
  ];

  int banner_currentPage = 0;
  int banner_itemCount = 4;
  PageController banner_pageController = PageController();
  List<BannerData> bannerDataList = [
    BannerData(
      backgroundimage: AssetImage("assets/images/main/main_banner1.png"),
      title: '',
      subtitle: '',
    ),
    BannerData(
      backgroundimage: AssetImage("assets/images/main/main_banner2.png"),
      title: '모두가 기다린\n그 이상의 앱',
      subtitle: '스펙로그가 여러분의 여정과 함께할게요',
    ),
    BannerData(
      backgroundimage: AssetImage("assets/images/main/main_banner3.png"),
      title: '나만의 포트폴리오',
      subtitle: '로그로 ‘나만의 포트폴리오’를 만들어 보세요',
    ),
    BannerData(
      backgroundimage: AssetImage("assets/images/main/main_banner4.png"),
      title: '앱 런칭을 위한 도전기',
      subtitle: '출시 하기까지, 우리의 회고..',
    ),
  ];
  Map<String, dynamic> log_data = {};

  void Get_Data() async {
    if (context.read<User_Data>().user_data['develop_type'].length != 0) {
      String id = context.read<User_Data>().user_data['develop_type'][0]['id'];
      Map<String, dynamic> log_datas =
          await PocketBaseData().Get_Develop_Log(id);
      setState(() {
        log_data = log_datas;
        page_load = true;
        bannerDataList.removeAt(0);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    banner_pageController.addListener(() {
      setState(() {
        banner_currentPage = banner_pageController.page?.round() ?? 0;
      });
    });
    program_pageController.addListener(() {
      setState(() {
        program_currentPage = program_pageController.page?.round() ?? 0;
      });
    });
    Get_Data();
  }

  @override
  Widget build(BuildContext context) {
    return page_load
        ? Scaffold(
            extendBodyBehindAppBar: true, //body 위에 appbar
            appBar: AppBar(
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              titleSpacing: 0.0,
              backgroundColor: Colors.transparent, //appBar 투명색
              title: Container(
                margin: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/spac_logo.svg",
                      width: 30,
                      height: 31,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 24,
                          width: 134,
                          padding:
                              EdgeInsets.only(top: 3, bottom: 3, right: 12),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFF3F3F3)),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '스팩폴리오',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFFB3B3B3),
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 66,
                          height: 24,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: ShapeDecoration(
                            color: Color(0xFF0059FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '스팩로그',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 16, top: 12, bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(),
                        ),
                      );
                    },
                    child: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                )
              ],
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 261,
                          child: PageView.builder(
                            controller: banner_pageController,
                            scrollDirection: Axis.horizontal,
                            itemCount: bannerDataList.length,
                            itemBuilder: (BuildContext context, int index) {
                              BannerData bannerData = bannerDataList[index];
                              return MainBannerWidget(
                                backgroundimage: bannerData.backgroundimage,
                                title: bannerData.title,
                                subtitle: bannerData.subtitle,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          left: 16,
                          bottom: 20,
                          child: ProgramDotsIndicator(
                            pageCount: bannerDataList.length,
                            currentPage: banner_currentPage,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.only(right: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          context
                                      .read<User_Data>()
                                      .user_data['develop_type']
                                      .length ==
                                  0
                              ? Text(
                                  '인기 프로젝트 추천',
                                  style: TextStyle(
                                    color: Color(0xFF0059FF),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text_Point(
                                        '${context.read<User_Data>().record.record!.data['nickname']}님'),
                                    Text(
                                      '을 위한 맞춤 프로젝트',
                                      style: TextStyle(
                                        color: Color(0xFF0059FF),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                          Row(
                            children: [
                              Text(
                                '더보기',
                                style: TextStyle(
                                  color: Color(0xFF7F7F7F),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SvgPicture.asset(
                                "assets/icons/chevron-right.svg",
                                color: Color(0xFF7F7F7F),
                                width: 16,
                                height: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 143,
                      padding: EdgeInsets.only(left: 16),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            spacing: 8,
                            children: [
                              MainProjectCardWidget(
                                backgroundimagestring:
                                    "assets/images/main/Project1.png",
                                title: '러닝 플랫폼 서비스',
                                subtitle: '러닝크루를 위한 안전 관리',
                                tag1: '백엔드',
                                tag2: '기획',
                                tag3: '디자이너',
                                view: 320,
                                like: 20,
                              ),
                              MainProjectCardWidget(
                                backgroundimagestring:
                                    "assets/images/main/Project4.png",
                                title: '공유 자전거 플랫폼 서비스',
                                subtitle: '안전과 건강을 생각한',
                                tag1: 'JAVA',
                                tag2: '기획',
                                tag3: '디자이너',
                                view: 300,
                                like: 12,
                              ),
                              MainProjectCardWidget(
                                backgroundimagestring:
                                    "assets/images/main/Project5.png",
                                title: '전기차 플랫폼 서비스',
                                subtitle: '신개념 전기차 충전 서비스',
                                tag1: '프론트엔드',
                                tag2: '디자이너',
                                view: 300,
                                like: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                      width: 360,
                      height: 6,
                      decoration: BoxDecoration(color: Color(0xFFF3F3F3)),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    context
                                .read<User_Data>()
                                .user_data['develop_type']
                                .length !=
                            0
                        ? Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            padding: EdgeInsets.only(right: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text_Point(context
                                        .read<User_Data>()
                                        .user_data['develop_type'][0]
                                    ['develop_type']),
                                Text(
                                  ' 추천 로그',
                                  style: TextStyle(
                                    color: Color(0xFF0059FF),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Get_Data();
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        '더보기',
                                        style: TextStyle(
                                          color: Color(0xFF7F7F7F),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        "assets/icons/chevron-right.svg",
                                        color: Color(0xFF7F7F7F),
                                        width: 16,
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    context
                                .read<User_Data>()
                                .user_data['develop_type']
                                .length !=
                            0
                        ? IntrinsicHeight(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(children: [
                                for (String key in log_data.keys)
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: LogportfolioWidget(
                                            title: log_data[key].data['title'],
                                            content:
                                                log_data[key].data['content'],
                                            net_avatar: NetworkImage(
                                                log_data[key]
                                                    .data['user_avatar']),
                                            nickname: log_data[key]
                                                .data['user_nickname'],
                                            tag: log_data[key]
                                                .data['develop_type']),
                                      ),
                                      key !=
                                              log_data.keys
                                                  .toList()[log_data.length - 1]
                                          ? Divider(
                                              height: 1,
                                              color: Color(0xFFE6E6E6))
                                          : Container(),
                                    ],
                                  ),
                              ]),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                      width: 360,
                      height: 6,
                      decoration: BoxDecoration(color: Color(0xFFF3F3F3)),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.only(right: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '인기 로그',
                            style: TextStyle(
                              color: Color(0xFF0059FF),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '더보기',
                                style: TextStyle(
                                  color: Color(0xFF7F7F7F),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SvgPicture.asset(
                                "assets/icons/chevron-right.svg",
                                color: Color(0xFF7F7F7F),
                                width: 16,
                                height: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: LogportfolioWidget(
                          title: '2023년 개발자의 회고',
                          content:
                              '로그 내용 적는 부분 이번 코딩 강좌에서는 구글 애널리틱스가 무엇인지 살펴보고 웹사이트에 연결하는 방법을 알아볼게요. 디자인베이스 강좌는 맥을 기준으로 해서 윈도우 사용자와 일 부 차이가 있을 수 있습니다. 이번 코딩 강좌에서는 구글 애널리틱스가 무엇인지 살펴보고 웹사이트에 연결하는 방법을 알아볼게요. 디자인베이스 강좌는 맥을 기준으로 해서 윈도우 사용자와 일부 차이가 있을 수 있습니다.',
                          avatar:
                              AssetImage("assets/images/main/log-profile1.png"),
                          nickname: 'qwerd4578',
                          tag: [
                            "백엔드",
                            "코딩",
                            "JAVA",
                          ]),
                    ),
                    Divider(height: 1, color: Color(0xFFE6E6E6)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: LogportfolioWidget(
                          title: '2023년 AI 트랜드',
                          content:
                              'AI가 점점 발전하고 있는 요즘 시대, 2023년의 AI는 어떻게 발전하고 있을까요? 요즘 시대의 AI는 하는 방법을 알아볼게요. 디자인베이스 강좌는 맥을 기준으로 해서 윈도우 사용자와 일 부 차이가 있을 수 있습니다. 이번 코딩 강좌에서는 구글 애널리틱스가 무엇인지 살펴보고 웹사이트에 연결하는 방법을 알아볼게요. 디자인베이스 강좌는 맥을 기준으로 해서 윈도우 사용자와 일부 차이가 있을 수 있습니다.',
                          avatar:
                              AssetImage("assets/images/main/log-profile2.png"),
                          thumbnail:
                              AssetImage("assets/images/main/img_log.png"),
                          nickname: 'sfacdev',
                          tag: [
                            "프론트엔드",
                            "HTML",
                            "CSS",
                            "JavaScript",
                          ]),
                    ),
                    Divider(height: 1, color: Color(0xFFE6E6E6)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: LogportfolioWidget(
                          title: '23세의 개발자가 되기 위한 길',
                          content:
                              '이 회사에 입사하며 ‘막노동’이라는 메타포가 내 생각을 지배했다. 그 중에 나는 나를 아무것으로도 제한하지 않는다는 생각이 있었다. 예를 들면 나는 소프트웨어 개발자니까 코드만 작성할 거야 같은 생각에서 벗어나자는 것이었다.',
                          avatar:
                              AssetImage("assets/images/main/log-profile3.png"),
                          nickname: 'study_ing02',
                          tag: [
                            "백엔드",
                            "IOS",
                            "Xcode",
                          ]),
                    ),
                    Image.asset("assets/images/main/banner.png"),
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.only(right: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '인기 커뮤니티',
                            style: TextStyle(
                              color: Color(0xFF0059FF),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '더보기',
                                style: TextStyle(
                                  color: Color(0xFF7F7F7F),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SvgPicture.asset(
                                "assets/icons/chevron-right.svg",
                                color: Color(0xFF7F7F7F),
                                width: 16,
                                height: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: CommunityPortfolioWidget(
                        title: "프로젝트 설문조사 해주세요",
                        content:
                            "개발자분들 설문조사 참여해주시면 추첨을 통하여 ~~드립니다 많은 참여부탁드려요. 개발자분들 설문조사 참여해주시면 드립니다 많은 참여부탁드려요.",
                        thumbnail:
                            AssetImage("assets/images/main/img_com1.png"),
                        avatar:
                            AssetImage("assets/images/main/com_profile1.png"),
                        nickname: "아이브",
                        tag1: "자유",
                        tag2: "디자이너",
                        tag3: "기획",
                        job: '디자이너',
                        like: 12,
                        comment: 1,
                        view: 300,
                      ),
                    ),
                    Divider(height: 1, color: Color(0xFFE6E6E6)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: CommunityPortfolioWidget(
                        title: "혼자 프로젝트하다가 질문 있습니다.",
                        content:
                            "안녕하세요, 혼자 프로젝트를 진행하던 중에 도움이 필요한 부분이 있어 질문드립니다. 제 코드에서 발생하는 이슈를 해결하거나, 개선 아이디어를 공유해주실 수 있는 분들이 계신가요? 감사합니다!",
                        thumbnail:
                            AssetImage("assets/images/main/img_com2.png"),
                        avatar:
                            AssetImage("assets/images/main/com_profile2.png"),
                        nickname: "NewCoder312",
                        tag1: "질문",
                        tag2: "백엔드",
                        tag3: "Kotlin",
                        job: 'JAVA',
                        like: 10,
                        comment: 2,
                        view: 230,
                      ),
                    ),
                    Container(
                      width: 360,
                      height: 6,
                      decoration: BoxDecoration(color: Color(0xFFF3F3F3)),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.only(right: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          context
                                      .read<User_Data>()
                                      .user_data['develop_type']
                                      .length ==
                                  0
                              ? Text(
                                  '최신 교육 프로그램',
                                  style: TextStyle(
                                    color: Color(0xFF0059FF),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text_Point(
                                        '${context.read<User_Data>().record.record!.data['nickname']}님'),
                                    Text(
                                      '을 위한 교육 프로그램',
                                      style: TextStyle(
                                        color: Color(0xFF0059FF),
                                        fontSize: 16,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                          Row(
                            children: [
                              Text(
                                '더보기',
                                style: TextStyle(
                                  color: Color(0xFF7F7F7F),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SvgPicture.asset(
                                "assets/icons/chevron-right.svg",
                                color: Color(0xFF7F7F7F),
                                width: 16,
                                height: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 202,
                          child: PageView.builder(
                            controller: program_pageController,
                            scrollDirection: Axis.horizontal,
                            itemCount: programDataList.length,
                            itemBuilder: (BuildContext context, int index) {
                              ProgramData programData = programDataList[index];
                              return MainProgramCardWidget(
                                backgroundimage: programData.backgroundimage,
                                content: programData.content,
                                tag1: programData.tag1,
                                tag2: programData.tag2,
                                tag3: programData.tag3,
                                tag4: programData.tag4,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          left: 16,
                          bottom: 20,
                          child: ProgramDotsIndicator(
                            pageCount: programDataList
                                .length, // Replace with your actual item count
                            currentPage: program_currentPage,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}

class BannerDotsIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  BannerDotsIndicator({required this.pageCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 4),
          child: index == currentPage
              ? Container(
                  width: 28,
                  height: 4,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              : Container(
                  width: 10,
                  height: 4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        index == currentPage ? Colors.white : Color(0xFFCCCCCC),
                  ),
                ),
        );
      }),
    );
  }
}

class ProgramDotsIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  ProgramDotsIndicator({required this.pageCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 4),
          child: index == currentPage
              ? Container(
                  width: 28,
                  height: 4,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              : Container(
                  width: 10,
                  height: 4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        index == currentPage ? Colors.white : Color(0xFFCCCCCC),
                  ),
                ),
        );
      }),
    );
  }
}

class ProgramData {
  final AssetImage backgroundimage;
  final String content;
  final String? tag1;
  final String? tag2;
  final String? tag3;
  final String? tag4;

  ProgramData({
    required this.backgroundimage,
    required this.content,
    this.tag1,
    this.tag2,
    this.tag3,
    this.tag4,
  });
}

class BannerData {
  final AssetImage backgroundimage;
  final String? title;
  final String? subtitle;

  BannerData({
    this.title,
    this.subtitle,
    required this.backgroundimage,
  });
}
