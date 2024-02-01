import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/career_company.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/career_period.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/career_select.dart';

class Career_Page extends StatefulWidget {
  const Career_Page({super.key});

  @override
  State<Career_Page> createState() => _Career_PageState();
}

class _Career_PageState extends State<Career_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Career_Select(),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 80,
              child:
                  context.read<Page_Controller>().select_info['career_type'] !=
                          null
                      ? Career_Company()
                      : Container(),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              height: 80,
              child:
                  context.read<Page_Controller>().select_info['career_type'] !=
                          null
                      ? Career_Period()
                      : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
