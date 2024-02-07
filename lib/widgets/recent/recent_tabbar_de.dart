import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/screen/search.dart';

class Recent_Appbar_de extends StatefulWidget {
  const Recent_Appbar_de({super.key});

  @override
  State<Recent_Appbar_de> createState() => _Recent_Appbar_deState();
}

class _Recent_Appbar_deState extends State<Recent_Appbar_de> {
  List<String> tab_list = ['최근 본 로그', '최근 본 커뮤니티'];
  Map<String, bool> active = {'page_1': true, 'page_2': false};
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          for (int i = 0; i < tab_list.length; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  active.forEach((key, value) {
                    active[key] = false;
                  });
                  active['page_${i + 1}'] = true;
                });
                context
                    .read<Page_Controller>()
                    .Change_Recent_page('page_${i + 1}');
              },
              child: IntrinsicWidth(
                child: Container(
                  margin: EdgeInsets.only(right: i == 0 ? 8 : 0),
                  height: 21,
                  child: Text(
                    tab_list[i],
                    maxLines: 1,
                    style: TextStyle(
                      color: active['page_${i + 1}']!
                          ? Color(0xff000000)
                          : Color(0xFFD9D9D9),
                      fontSize: 18,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              alignment: Alignment.centerRight,
            ),
          ),
          SizedBox(
            width: 17,
          ),
          GestureDetector(
            onTap: () async {},
            child: SvgPicture.asset(
              'assets/icons/pencil-alt.svg',
              color: Color(0xff999999),
            ),
          )
        ],
      ),
    );
  }
}
