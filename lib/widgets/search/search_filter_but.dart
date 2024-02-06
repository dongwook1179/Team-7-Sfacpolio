import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/widgets/search/search_bottom.dart';

class Search_Filter_button extends StatefulWidget {
  const Search_Filter_button({super.key});

  @override
  State<Search_Filter_button> createState() => _Search_Filter_buttonState();
}

class _Search_Filter_buttonState extends State<Search_Filter_button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Container(child: Expanded(child: Search_Bottom_Sheet()));
          },
        );
      },
      child: IntrinsicWidth(
        child: Container(
          margin: EdgeInsets.only(right: 8, left: 16),
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color(0xFF0059FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: SvgPicture.asset(
            'assets/icons/filter.svg',
          )),
        ),
      ),
    );
  }
}
