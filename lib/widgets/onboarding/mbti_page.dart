import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/mbtidetail.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/mbtiselect.dart';

class Mbti_Page extends StatefulWidget {
  const Mbti_Page({super.key});

  @override
  State<Mbti_Page> createState() => _Mbti_PageState();
}

class _Mbti_PageState extends State<Mbti_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 540,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          MbtiSelect(),
          SizedBox(
            height: 16,
          ),
          context.watch<Page_Controller>().mbti_data.keys.length > 2
              ? MbtiDetail()
              : Container(),
        ],
      ),
    );
  }
}
