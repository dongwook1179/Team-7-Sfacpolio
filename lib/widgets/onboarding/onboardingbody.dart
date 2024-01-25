import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/onboardingpageview.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/uselanguage.dart';
import '/provider/pagecontrol.dart';
import '/widgets/onboarding/mbtiselect.dart';
import '/widgets/onboarding/categorymold.dart';
import '/widgets/onboarding/mbtidetail.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  List<String> develop_type = [
    '서버/백앤드 개발자',
    '프론트엔드 개발자',
    '웹 풀스택 개발자',
    '안드로이드 개발자',
    'IOS 개발자',
    '크로스플랫폼 개발자',
    '게임 클라이언트 개발',
    '게임 서버 개발자',
    'DBA',
    '빅데이터 엔지니어',
    '인공지능/머신러닝',
    'devops/시스템 엔지니어',
    '정보보안 담당자',
    'QA 엔지니어',
    '개발 PM',
    'HW/임베디드',
    'SW/솔루션',
    '웹퍼블리셔',
    'VR/AR/3D',
    '블록체인',
    '기술지원'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      padding: EdgeInsets.zero,
      child: context.watch<Page_Controller>().pagenum == 1
          ? CategoryMold(develop_type)
          : context.watch<Page_Controller>().pagenum == 2
              ? UseLanguage()
              : context.watch<Page_Controller>().pagenum == 4
                  ? OnboardingPageView()
                  : Container(),
    );
  }
}
