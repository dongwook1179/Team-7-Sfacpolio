import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/mycomment/mycomment_slot.dart';

class MyComment_Body extends StatefulWidget {
  const MyComment_Body({super.key});

  @override
  State<MyComment_Body> createState() => _MyComment_BodyState();
}

class _MyComment_BodyState extends State<MyComment_Body> {
  Map<String, dynamic> data = {};
  Map<String, Widget> data_widget = {};
  bool page_load = false;
  List<String> data_keys = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_Data();
  }

  void Get_Data() async {
    Map<String, dynamic> load_data = await PocketBaseData().Get_MyComment();
    setState(() {
      data = load_data;
      data_keys = data.keys.toList();
      page_load = true;
    });
    Heart_Active();
    Sort_Data();
    Slot_Build();
  }

  void Sort_Data() {
    String sort = context.read<Page_Controller>().filter_text;
    data_keys.sort(
      (a, b) {
        int compare = data[b][sort].compareTo(data[a][sort]);
        return compare;
      },
    );
  }

  void Slot_Build() {
    data_widget = {};
    for (String key in data_keys) {
      data_widget[key] = MyComment_Slot_Build(data[key]);
    }
  }

  void Heart_Active() {
    for (String key in data_keys) {
      for (var datas in data[key]['like']) {
        print(data);
        if ('modeumi19950804' == datas.data['user_id']) {
          data[key]['like_active'] = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return page_load
        ? Consumer<Page_Controller>(builder: (context, pageController, _) {
            Sort_Data();
            Slot_Build();
            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: data_widget.values.toList(),
                ),
              ),
            );
          })
        : Container();
  }
}
