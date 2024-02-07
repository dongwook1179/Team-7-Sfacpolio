import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/dropdown.dart';
import 'package:team_7_sfacpolio/widgets/interest/community_slot_build.dart';

class Interest_Body extends StatefulWidget {
  final String type;
  const Interest_Body(this.type);

  @override
  State<Interest_Body> createState() => _Interest_BodyState();
}

class _Interest_BodyState extends State<Interest_Body> {
  bool page_load = false;
  Map<String, dynamic> data = {};
  Map<String, dynamic> data_division = {};
  Map<String, Widget> data_widget = {};
  List<String> data_keys = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_Data();
  }

  void Get_Data() async {
    Map<String, dynamic> data_load = {};
    if (widget.type == 'log') {
      data_load = await PocketBaseData().Get_Log();
    } else if (widget.type == 'community') {
      data_load = await PocketBaseData().Get_Community();
    }
    context.read<Page_Controller>().Drop_Down('update');

    setState(() {
      data = data_load;
      data_keys = data.keys.toList();
      page_load = true;
    });
    print('데이터 확인 : ${data}');
    Sort_Data();
    Widget_Build();
  }

  void Widget_Build() {
    data_widget = {};
    for (String key in data_keys) {
      data_widget[key] = Community_Slot_Build(data[key]);
    }
  }

  void Sort_Data() {
    String sort = context.read<Page_Controller>().filter_text;
    print(sort);
    data_keys.sort(
      (a, b) {
        int compare = data[b][sort].compareTo(data[a][sort]);
        return compare;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return page_load
        ? Consumer<Page_Controller>(builder: (context, pageController, _) {
            Sort_Data();
            Widget_Build();
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 32,
                      margin: EdgeInsets.only(top: 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              '${data.length}개',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            height: 32,
                            child: Center(
                              child: DropDown(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: data_widget.values.toList()),
                  ],
                ),
              ),
            );
          })
        : Container();
  }
}
