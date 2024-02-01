import 'package:flutter/material.dart';
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
      child: TextField(
        controller: search_control,
        onChanged: (text) {
          context.read<Page_Controller>().Input_Text(text);
        },
        decoration: InputDecoration(
          hintText: '예) C++',
          hintStyle: TextStyle(
            color: Color(0xFF4C4C4C),
            fontSize: 12,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 14),
          fillColor: Color(0xFFF3F3F3),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
