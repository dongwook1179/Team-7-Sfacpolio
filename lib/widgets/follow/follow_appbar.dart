import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/screen/withdrawal.dart';

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
            // PocketBaseData().Dummy_2();
            await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Scaffold(
                    body: Withdrawal(),
                    backgroundColor: Color(0xffffffff).withOpacity(0),
                  );
                });
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
