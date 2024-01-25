import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/mbtidetail.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/mbtiselect.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  PageController pageController = PageController();
  int pagenum = 0;
  List<String> view_title = ['개인 성향', '개발 경력', '업무가능 시간'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 36,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (int i = 0; i < view_title.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    pagenum = i;
                  });
                  pageController.animateToPage(i,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: Container(
                  width: 120,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: pagenum == i
                          ? BorderSide(width: 3, color: Color(0xFF000000))
                          : BorderSide(width: 1, color: Color(0xFFE6E6E6)),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      view_title[i],
                      style: TextStyle(
                        color: pagenum == i
                            ? Color(0xFF020202)
                            : Color(0xFFE6E6E6),
                        fontSize: 14,
                        // fontFamily: 'Pretendard',
                        fontWeight:
                            pagenum == i ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
          ]),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          width: 360,
          height: 470,
          child: PageView.builder(
              controller: pageController,
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  pagenum = index;
                });
              },
              itemBuilder: (context, index) {
                return index == 0
                    ? Column(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 0),
                            width: 360,
                            child: MbtiSelect(),
                          ),
                          SizedBox(
                            height: 21,
                          ),
                          context
                                      .watch<Page_Controller>()
                                      .mbti_data
                                      .keys
                                      .length >
                                  2
                              ? MbtiDetail()
                              : Container(),
                        ],
                      ) // A
                    : index == 1
                        ? Container() // B
                        : index == 2
                            ? Container() //C
                            : Container();
              }),
        )
      ],
    );
  }
}
