import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Create_Language {
  Future<Widget> Create_Widget(BuildContext context, String text) async {
    String image_url = await PocketBaseData().Default_Image();
    Widget widgets = GestureDetector(
      onTap: () {
        Provider.of<Page_Controller>(context, listen: false)
            .Select_Widget(text, Container());
        Provider.of<Page_Controller>(context, listen: false)
            .Add_Information('language', text);
      },
      child: IntrinsicWidth(
          child: Container(
        margin: EdgeInsets.only(right: 12),
        height: 32,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            border: Border.all(width: 1, color: Color(0xFF0059FF)),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              child: SvgPicture.network(image_url),
            ),
            SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                color: Color(0xFF0059FF),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      )),
    );
    return widgets;
  }
}
