import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/onboarding/languageslot.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool input_text = true;
  TextEditingController search_control = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 48,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: CupertinoTextField(
        controller: search_control,
        onChanged: (text) {
          setState(() {
            if (text.length == 0) {
              input_text = true;
            } else {
              input_text = false;
            }
          });
          context.read<Page_Controller>().Input_Filter(text);
        },
        suffix: Container(
          margin: EdgeInsets.only(right: 16),
          width: 24,
          height: 24,
          child: Container(
            child: GestureDetector(
              onTap: () {
                if (!input_text) {
                  search_control.text = '';
                  context.read<Page_Controller>().Input_Filter('');
                }
              },
              child: Icon(
                input_text ? CupertinoIcons.search : CupertinoIcons.xmark,
                color: Color(0xFF000000),
              ),
            ),
          ),
        ),
        placeholder: '개발 언어 검색',
        placeholderStyle: TextStyle(
          color: Color(0xFF4C4C4C),
          fontSize: 14,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
