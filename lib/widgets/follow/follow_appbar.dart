import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/screen/search.dart';

class Follow_Appbar extends StatefulWidget {
  const Follow_Appbar({super.key});

  @override
  State<Follow_Appbar> createState() => _Follow_AppbarState();
}

class _Follow_AppbarState extends State<Follow_Appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 48,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: SvgPicture.asset(
              'assets/icons/chevron-left.svg',
              width: 16,
              height: 16,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Search()));
          },
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            width: 24,
            height: 24,
          ),
        ),
      ]),
    );
  }
}
