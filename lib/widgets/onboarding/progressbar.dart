import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      width: 328,
      height: 1,
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.topLeft,
        widthFactor: context.watch<Page_Controller>().pagenum / 6,
        heightFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF0059FF),
          ),
        ),
      ),
    );
  }
}
