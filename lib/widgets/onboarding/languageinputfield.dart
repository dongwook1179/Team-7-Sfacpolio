import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Language_InputField extends StatefulWidget {
  const Language_InputField({super.key});

  @override
  State<Language_InputField> createState() => _Language_InputFieldState();
}

class _Language_InputFieldState extends State<Language_InputField> {
  bool input_text = true;
  TextEditingController search_control = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 46,
      child: CupertinoTextField(
        controller: search_control,
        onChanged: (text) {
          context.read<Page_Controller>().Input_Text(text);
        },
        placeholder: '예) C++',
        placeholderStyle: TextStyle(
          color: Color(0xFF4C4C4C),
          fontSize: 12,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
        ),
        padding: EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
