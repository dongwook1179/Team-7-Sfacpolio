import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/career_page.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/condition_page.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/mbti_page.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/service_page.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/language_page.dart';
import '/provider/pagecontrol.dart';
import '/widgets/onboarding/categorymold.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  List<String> datas = [];
  bool page_load = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load_Develop();
  }

  void Load_Develop() async {
    datas = await PocketBaseData().Develop_Load();
    setState(() {
      page_load = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return page_load
        ? Container(
            height: 535,
            padding: EdgeInsets.zero,
            child: context.watch<Page_Controller>().pagenum == 1
                ? CategoryMold(datas)
                : context.watch<Page_Controller>().pagenum == 2
                    ? UseLanguage()
                    : context.watch<Page_Controller>().pagenum == 3
                        ? Service_Page()
                        : context.watch<Page_Controller>().pagenum == 4
                            ? Mbti_Page()
                            : context.watch<Page_Controller>().pagenum == 5
                                ? Career_Page()
                                : context.watch<Page_Controller>().pagenum == 6
                                    ? Condition_Page()
                                    : Container(),
          )
        : Container();
  }
}
