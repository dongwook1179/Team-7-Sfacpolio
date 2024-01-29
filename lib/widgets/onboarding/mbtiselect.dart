import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/jsondata/dataload.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class MbtiSelect extends StatefulWidget {
  const MbtiSelect({super.key});

  @override
  State<MbtiSelect> createState() => _MbtiSelectState();
}

class _MbtiSelectState extends State<MbtiSelect> {
  Map<String, dynamic> mbtidata = {};
  Map<String, Widget> mbti_widget = {};
  Map<String, Color> border_color = {};
  Map<String, Color> back_color = {};
  Map<String, Color> font_color = {};
  DataLoad dataLoad = DataLoad();
  bool pageload = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Init_Page();
  }

  void Init_Page() async {
    await Load_data();
    Give_Color();
    Mbti_Build(context);
    setState(() {
      pageload = true;
    });
  }

  Future<void> Load_data() async {
    mbtidata = await dataLoad.JsonLoad('mbti');
  }

  void Give_Color() {
    for (String text in mbtidata.keys.toList()) {
      border_color[text] = Color(0xFF7F7F7F);
      back_color[text] = Color(0XFFFFFFFF);
      font_color[text] = Color(0xFF7F7F7F);
    }
  }

  void Change_Color(BuildContext context, String text) {
    setState(() {
      border_color.forEach((key, value) {
        border_color[key] = Color(0xFF7F7F7F);
      });
      border_color[text] = Color(0xFF0059FF);
      back_color.forEach((key, value) {
        back_color[key] = Color(0XFFFFFFFF);
      });
      back_color[text] = Color(0xFF0059FF);
      font_color.forEach((key, value) {
        font_color[key] = Color(0xFF7F7F7F);
      });
      font_color[text] = Color(0xFFFFFFFF);
      Mbti_Build(context);
    });
  }

  void Mbti_Build(BuildContext context) {
    for (String title in mbtidata.keys.toList()) {
      mbti_widget[title] = GestureDetector(
        onTap: () {
          Change_Color(context, title);
          context.read<Page_Controller>().Send_Data(mbtidata[title]);
        },
        child: Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
              color: back_color[title],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: border_color[title]!)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: font_color[title],
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                mbtidata[title]['title'],
                style: TextStyle(
                  color: font_color[title],
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return pageload
        ? Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(0),
            child: GridView.count(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: <Widget>[
                for (String text in mbti_widget.keys.toList())
                  mbti_widget[text]!
              ],
            ))
        : Container();
  }
}
