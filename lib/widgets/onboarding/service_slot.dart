import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';

class Service_Slot extends StatefulWidget {
  const Service_Slot({super.key});

  @override
  State<Service_Slot> createState() => _Service_SlotState();
}

class _Service_SlotState extends State<Service_Slot> {
  Map<String, dynamic> datas = {};
  Map<String, Widget> datas_image = {};
  Map<String, Widget> service_widget = {};
  Map<String, bool> widget_active = {};
  bool page_load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Init_Page();
  }

  void Init_Page() async {
    await Get_Data();
    Build_Widget();
    setState(() {
      page_load = true;
    });
    print('진입');
    print(datas);
    print(service_widget);
    print(page_load);
  }

  Future<void> Get_Data() async {
    datas = await PocketBaseData().Service_Load();
    await Load_Image();
  }

  Future<void> Load_Image() async {
    for (String text in datas.keys.toList()) {
      datas_image[text] = Image.network(
        'assets/images/service/${datas[text]['image']}',
        fit: BoxFit.fill,
        // placeholderBuilder: (BuildContext context) => Container(
        //   color: Colors.grey,
        // ),
      );
      widget_active[text] = false;
    }
  }

  Widget Build_Send_Widget(String text) {
    Widget widgets = GestureDetector(
      onTap: () {
        setState(() {
          widget_active[text] = !widget_active[text]!;
        });
        Provider.of<Page_Controller>(context, listen: false)
            .Service_Data(text, Container());
        Build_Widget();
        Provider.of<Page_Controller>(context, listen: false)
            .Add_Information('service', text);
      },
      child: Container(
        width: 61,
        height: 32,
        margin: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                datas[text]['image'],
              ),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color(0xff000000).withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
    return widgets;
  }

  void Build_Widget() {
    for (String text in datas.keys) {
      service_widget[text] = GestureDetector(
        onTap: () {
          Widget widget = Build_Send_Widget(text);
          context.read<Page_Controller>().Service_Data(text, widget);
          setState(() {
            widget_active[text] = !widget_active[text]!;
          });
          print(widget_active[text]);
          Provider.of<Page_Controller>(context, listen: false)
              .Add_Information('service', text);
          Build_Widget();
        },
        child: Container(
          width: 64,
          height: 93,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: ClipOval(
                      child: Image.network(
                        // 'assets/images/service/${datas[text]['image_name']}',
                        datas[text]['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  widget_active[text]!
                      ? Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff000000).withOpacity(0.4)),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/check.svg',
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: Color(0xff0000000).withOpacity(0)),
                        ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Color(0xFF020202),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
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
    return page_load
        ? Container(
            width: 360,
            height: 448,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: service_widget.values.toList(),
              ),
            ),
          )
        : Container();
  }
}
