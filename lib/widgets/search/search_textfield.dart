import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_7_sfacpolio/widgets/search/search_bottom.dart';

class Search_Textfield extends StatefulWidget {
  const Search_Textfield({super.key});

  @override
  State<Search_Textfield> createState() => _Search_TextfieldState();
}

class _Search_TextfieldState extends State<Search_Textfield> {
  TextEditingController search_control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 48,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: search_control,
        onChanged: (text) {
          // context.read<Page_Controller>().Input_Filter(text);
        },
        decoration: InputDecoration(
          suffixIcon: Container(
            margin: EdgeInsets.only(right: 16),
            width: 24,
            height: 24,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Search_Bottom_Sheet();
                  },
                );
              },
              child: SvgPicture.asset(
                search_control.text.length > 0
                    ? 'assets/icons/x.svg'
                    : 'assets/icons/search.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
          hintText: '검색어를 입력해주세요.',
          hintStyle: TextStyle(
            color: Color(0xFF4C4C4C),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          filled: true,
          fillColor: Color(0xFFF3F3F3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
