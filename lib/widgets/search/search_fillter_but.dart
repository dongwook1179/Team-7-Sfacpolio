import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search_Filter_button extends StatefulWidget {
  const Search_Filter_button({super.key});

  @override
  State<Search_Filter_button> createState() => _Search_Filter_buttonState();
}

class _Search_Filter_buttonState extends State<Search_Filter_button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: IntrinsicWidth(
        child: Container(
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Color(0xFF0059FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: SvgPicture.asset(
            'assets/icons/adjustments.svg',
          )),
        ),
      ),
    );
  }
}
