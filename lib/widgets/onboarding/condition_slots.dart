import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Condition_Slots extends StatefulWidget {
  final String type;
  final String text;
  const Condition_Slots(this.type, this.text);

  @override
  State<Condition_Slots> createState() => _Condition_SlotsState();
}

class _Condition_SlotsState extends State<Condition_Slots> {
  @override
  Widget build(BuildContext context) {
    bool active = false;
    if (widget.type == 'type') {
      setState(() {
        active = Provider.of<Page_Controller>(context, listen: false)
                .select_info['condition_type']
                ?.contains(widget.text) ??
            false;
      });
    } else if (widget.type == 'period') {
      setState(() {
        active = Provider.of<Page_Controller>(context, listen: false)
                .select_info['condition_period']
                ?.contains(widget.text) ??
            false;
      });
    }
    return GestureDetector(
      onTap: () {
        if (widget.type == 'type') {
          Provider.of<Page_Controller>(context, listen: false)
              .select_info['condition_type'] = [];
          Provider.of<Page_Controller>(context, listen: false)
              .Add_Information('condition_type', widget.text);
        } else if (widget.type == 'period') {
          Provider.of<Page_Controller>(context, listen: false)
              .select_info['condition_period'] = [];
          Provider.of<Page_Controller>(context, listen: false)
              .Add_Information('condition_period', widget.text);
        }
      },
      child: IntrinsicWidth(
        child: Container(
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: active ? Color(0xFF0059FF) : Color(0xFFB3B3B3),
            ),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: active ? Color(0xFF0059FF) : Color(0xFF7F7F7F),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: active ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
