import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Select_Slot extends StatefulWidget {
  const Select_Slot({super.key});

  @override
  State<Select_Slot> createState() => _Select_SlotState();
}

class _Select_SlotState extends State<Select_Slot> {
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
            onTap: () {},
            child: Container(
              child: Icon(
                CupertinoIcons.chevron_up,
                color: Color(0xFF000000),
                size: 24,
              ),
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
