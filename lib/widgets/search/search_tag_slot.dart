import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Search_Tag_Slot extends StatefulWidget {
  final String text;
  const Search_Tag_Slot(this.text);

  @override
  State<Search_Tag_Slot> createState() => _Search_Tag_SlotState();
}

class _Search_Tag_SlotState extends State<Search_Tag_Slot> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: Container(
      height: 32,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Color(0xFFE5EEFF)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              color: Color(0xFF0059FF),
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          GestureDetector(
            onTap: () {
              print('클릭');
              context.read<Page_Controller>().Search_Delete_Tag(widget.text);
            },
            child: SvgPicture.asset(
              'assets/icons/x.svg',
              width: 20,
              height: 20,
              color: Color(0xFF0059FF),
            ),
          )
        ],
      ),
    ));
  }
}
