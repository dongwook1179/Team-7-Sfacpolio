import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/bottom_sheet_1.dart';

class Select_Slot_1 extends StatefulWidget {
  const Select_Slot_1({super.key});

  @override
  State<Select_Slot_1> createState() => _Select_Slot_1State();
}

class _Select_Slot_1State extends State<Select_Slot_1> {
  @override
  Widget build(BuildContext context) {
    Map<String, Widget> widgets =
        context.watch<Page_Controller>().widget_select;
    return Container(
      width: 360,
      height: 56,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.only(left: 24),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Color(0xFFF3F3F3)),
          top: BorderSide(width: 1, color: Color(0xFFF3F3F3)),
          right: BorderSide(color: Color(0xFFF3F3F3)),
          bottom: BorderSide(color: Color(0xFFF3F3F3)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Bottom_Modal_Sheet_1('language', widgets);
                },
              );
            },
            child: Container(
              child: SvgPicture.asset(
                  'assets/icons/Property 2=Outline, Property 3=chevron-up.svg'),
            ),
          ),
          SizedBox(
            width: 24,
          ),
          Container(
            width: 277,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widgets.values.toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
