import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Tag_Slot_Build extends StatefulWidget {
  final String text;
  const Tag_Slot_Build(this.text);

  @override
  State<Tag_Slot_Build> createState() => _Tag_Slot_BuildState();
}

class _Tag_Slot_BuildState extends State<Tag_Slot_Build> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<Page_Controller>().Recent_Active(widget.text);
      },
      child: IntrinsicWidth(
        child: Container(
          height: 26,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: (context
                            .watch<Page_Controller>()
                            .recent_filter_list['${widget.text}'] ??
                        false)
                    ? Color(0xFF0059FF)
                    : Color(0xFFE6E6E6),
              ),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: (context
                            .watch<Page_Controller>()
                            .recent_filter_list['${widget.text}'] ??
                        false)
                    ? Color(0xFF0059FF)
                    : Color(0xFFB3B3B3),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
