import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/widgets/follow/follow_bottom.dart';
import 'package:team_7_sfacpolio/widgets/follow/follow_dialog.dart';

class Follow_Mold extends StatefulWidget {
  final String type;
  final int data_index;
  const Follow_Mold(this.type, this.data_index);

  @override
  State<Follow_Mold> createState() => _Follow_MoldState();
}

class _Follow_MoldState extends State<Follow_Mold> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 72,
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          context.read<Page_Controller>().follow_data[widget.type]
                      [widget.data_index]['image'] !=
                  ''
              ? Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(context
                                .read<Page_Controller>()
                                .follow_data[widget.type][widget.data_index]
                            ['image']),
                        fit: BoxFit.cover,
                      )),
                )
              : Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF0059FF)),
                ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.read<Page_Controller>().follow_data[widget.type]
                                [widget.data_index]['nickname'] !=
                            ''
                        ? context
                                .read<Page_Controller>()
                                .follow_data[widget.type][widget.data_index]
                            ['nickname']
                        : '  ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    context.read<Page_Controller>().follow_data[widget.type]
                        [widget.data_index]['email'],
                    style: TextStyle(
                      color: Color(0xFF4C4C4C),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Scaffold(
                      body: Follow_Dialog(),
                      backgroundColor: Color(0xffffffff).withOpacity(0),
                    );
                  });
              bool click_check =
                  Provider.of<Page_Controller>(context, listen: false)
                      .delete_state;

              if (click_check) {
                await PocketBaseData().Delete_Follow(
                    widget.type,
                    context.read<Page_Controller>().follow_data[widget.type]
                        [widget.data_index]['my_id'],
                    context.read<Page_Controller>().follow_data[widget.type]
                        [widget.data_index]['id']);

                Provider.of<Page_Controller>(context, listen: false)
                    .Delete_Follow(
                        widget.type,
                        context.read<Page_Controller>().follow_data[widget.type]
                            [widget.data_index]['id']);
              }
            },
            child: Container(
              width: 41,
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color(0xFF0059FF),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '삭제',
                  style: TextStyle(
                    color: Color(0xFF0059FF),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Container(
                      child: Expanded(
                          child: Follow_Bottom_Sheet(context
                              .read<Page_Controller>()
                              .follow_data[widget.type][widget.data_index])));
                },
              );
            },
            child: SvgPicture.asset(
              'assets/icons/dots-horizontal.svg',
              width: 18,
              height: 18,
              color: Color(0xff7F7F7F),
            ),
          )
        ],
      ),
    );
  }
}
