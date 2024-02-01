import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Career_Select extends StatefulWidget {
  const Career_Select({super.key});

  @override
  State<Career_Select> createState() => _Career_SelectState();
}

class _Career_SelectState extends State<Career_Select> {
  List<String> career_text = ['경력자입니다', '신입입니다'];
  Map<String, Color> font_color = {};
  Map<String, Color> border_color = {};
  Map<String, FontWeight> font_weight = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (String text in career_text) {
      font_color[text] = Color(0xFF7F7F7F);
      border_color[text] = Color(0xFF7F7F7F);
      font_weight[text] = FontWeight.w400;
    }
  }

  void Button_Active(String text) {
    setState(() {
      font_color.forEach(
        (key, value) => font_color[key] = Color(0xFF999999),
      );
      border_color.forEach(
        (key, value) => border_color[key] = Color(0xFF999999),
      );
      font_weight.forEach((key, value) {
        font_weight[key] = FontWeight.w400;
      });
      font_color[text] = Color(0xFF0059FF);
      border_color[text] = Color(0xFF0059FF);
      font_weight[text] = FontWeight.w700;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Page_Controller>(builder: (context, pageController, _) {
      return Container(
        width: 360,
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (String text in career_text)
              GestureDetector(
                onTap: () {
                  Button_Active(text);
                  if (context
                          .read<Page_Controller>()
                          .select_info['career_type'] !=
                      null) {
                    Provider.of<Page_Controller>(context, listen: false)
                        .select_info['career_type']!
                        .clear();
                  }
                  context
                      .read<Page_Controller>()
                      .Add_Information('career_type', text);
                  context.read<Page_Controller>().career_save = '';
                  context.read<Page_Controller>().period_save.clear();
                },
                child: Container(
                  width: 160,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: border_color[text]!)),
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: font_color[text],
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: font_weight[text],
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      );
    });
  }
}
