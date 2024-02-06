import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/createlanguage.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/directinput.dart';

class Language_Input extends StatefulWidget {
  const Language_Input({super.key});

  @override
  State<Language_Input> createState() => _Language_InputState();
}

class _Language_InputState extends State<Language_Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '찾으시는 개발 언어가 없으신가요?',
            style: TextStyle(
              color: Color(0xFF020202),
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () async {
              print('클릭');
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Scaffold(
                    body: Direct_Input(),
                    backgroundColor: Color(0xffffffff).withOpacity(0),
                  );
                },
              );
              String text = Provider.of<Page_Controller>(context, listen: false)
                  .language_text;
              if (text != '') {
                Widget widgets =
                    await Create_Language().Create_Widget(context, text);
                context.read<Page_Controller>().Select_Widget(text, widgets);
                context
                    .read<Page_Controller>()
                    .Add_Information('language', text);
              }
            },
            child: Text(
              '직접입력',
              style: TextStyle(
                color: Color(0xFF0059FF),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }
}
