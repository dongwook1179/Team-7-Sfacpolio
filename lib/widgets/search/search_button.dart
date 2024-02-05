import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Search_Button extends StatefulWidget {
  final String text;
  final String type;
  const Search_Button(this.text, this.type);

  @override
  State<Search_Button> createState() => _Search_ButtonState();
}

class _Search_ButtonState extends State<Search_Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<Page_Controller>()
            .Select_Fillter(widget.type, widget.text);
      },
      child: IntrinsicWidth(
        child: Container(
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 1,
                  color:
                      (context.read<Page_Controller>().fillter[widget.type] ??
                                  '')
                              .contains(widget.text)
                          ? Color(0xFF0059FF)
                          : Color(0xFFB3B3B3))),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color:
                    (context.read<Page_Controller>().fillter[widget.type] ?? '')
                            .contains(widget.text)
                        ? Color(0xFF0059FF)
                        : Color(0xFF7F7F7F),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight:
                    (context.read<Page_Controller>().fillter[widget.type] ?? '')
                            .contains(widget.text)
                        ? FontWeight.w700
                        : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
