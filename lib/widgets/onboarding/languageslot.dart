import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class LanguageSlot extends StatefulWidget {
  const LanguageSlot({super.key});

  @override
  State<LanguageSlot> createState() => _LanguageSlotState();
}

class _LanguageSlotState extends State<LanguageSlot> {
  PocketBaseData pocketBaseData = PocketBaseData();
  Map<String, dynamic> language_datas = {};
  Map<String, bool> language_bool = {};
  Map<String, Color> language_backcolor = {};
  Map<String, Color> language_fontcolor = {};
  Map<String, Color> language_bordercolor = {};
  Map<String, Widget> language_widget = {};
  Map<String, Widget> language_filter = {};
  Map<String, Widget> language_image = {};
  List<String> trend = [
    'Java',
    'Spring Boot',
    'Node.js',
    'Python',
    'JavaScript',
    'Kotlin'
  ];
  bool page_load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Init_page();
  }

  void Init_page() async {
    await Get_data();
    await Load_Image();
    Slot_Build();
    setState(() {
      page_load = true;
    });
  }

  Future<void> Get_data() async {
    language_datas = await pocketBaseData.Load_Data();
    for (String text in language_datas.keys.toList()) {
      language_bool[text] = false;
      language_backcolor[text] = Color(0xFFFFFFFF);
      language_fontcolor[text] = Color(0xFF7F7F7F);
      language_bordercolor[text] = Color(0xFF7F7F7F);
    }
  }

  Future<void> Load_Image() async {
    for (String text in language_datas.keys.toList()) {
      language_image[text] = SvgPicture.network(
        language_datas[text]['logo'],
      );
    }
  }

  void Color_Change(String text) {
    setState(() {
      if (language_bool[text]!) {
        language_fontcolor[text] = Color(0xFF0059FF);
        language_bordercolor[text] = Color(0xFF0059FF);
      } else {
        language_fontcolor[text] = Color(0xFF7F7F7F);
        language_bordercolor[text] = Color(0xFF7F7F7F);
      }
    });
  }

  void Slot_Build() {
    for (String text in language_datas.keys.toList()) {
      language_widget[text] = GestureDetector(
        onTap: () {
          setState(() {
            print(language_bool[text]);
            language_bool[text] = !language_bool[text]!;
            print(language_bool[text]);
            Color_Change(text);
            Slot_Build();
            Filter(Provider.of<Page_Controller>(context, listen: false).search);
          });
          print(text);
          print(language_bool[text]);
          print(language_backcolor[text]);
          context
              .read<Page_Controller>()
              .Select_Widget(text, language_widget[text]!);
        },
        child: IntrinsicWidth(
            child: Container(
          margin: EdgeInsets.only(right: 12),
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              border: Border.all(width: 1, color: language_bordercolor[text]!),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                child: language_image[text],
              ),
              SizedBox(width: 4),
              Text(
                text,
                style: TextStyle(
                  color: language_fontcolor[text]!,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight:
                      language_bool[text]! ? FontWeight.w700 : FontWeight.w400,
                ),
              )
            ],
          ),
        )),
      );
    }
    ;
  }

  void Filter(String search) {
    language_filter = {};
    for (var key in language_datas.keys) {
      String text = language_datas[key]?['search'];
      if (search == '') {
        for (String text1 in trend) {
          language_filter[text1] = language_widget[text1]!;
        }
      } else if (text.contains(search)) {
        language_filter[key] = language_widget[key]!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String searchText = context.watch<Page_Controller>().search;
    Filter(searchText);
    return SingleChildScrollView(
      child: page_load
          ? searchText == ''
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        '다른 개발자가 자주 선택하는 언어',
                        style: TextStyle(
                          color: Color(0xFF1D1D1D),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Wrap(
                          runSpacing: 12,
                          children: language_filter.values.toList(),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: SingleChildScrollView(
                    child: Wrap(
                      runSpacing: 12,
                      children: language_filter.values.toList(),
                    ),
                  ),
                )
          : Container(),
    );
  }
}
