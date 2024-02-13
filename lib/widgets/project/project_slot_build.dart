import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/project/project_deadline.dart';
import 'package:team_7_sfacpolio/widgets/project/project_detail.dart';
import 'package:team_7_sfacpolio/widgets/tag_slot.dart';

class Project_Slot_Build extends StatefulWidget {
  final dynamic data;
  const Project_Slot_Build(this.data);

  @override
  State<Project_Slot_Build> createState() => _Project_Slot_BuildState();
}

class _Project_Slot_BuildState extends State<Project_Slot_Build> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Provider.of<Page_Controller>(context, listen: false)
            .post_delete_active) {
          context.read<Page_Controller>().Post_Delete_Select(widget.data.id);
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Project_Detail(widget.data)));
        }
      },
      child: IntrinsicHeight(
        child: Container(
          width: 360,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 5, color: Color(0xFFE6E6E6)))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data.data['title'],
                            style: TextStyle(
                              color: Color(0xFF020202),
                              fontSize: 15,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.data.data['content'],
                            style: TextStyle(
                              color: Color(0xFF7F7F7F),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  context.watch<Page_Controller>().post_delete_active
                      ? Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                              color: context
                                      .watch<Page_Controller>()
                                      .post_delete_select
                                      .contains(widget.data.id)
                                  ? Color(0xFF0059FF)
                                  : Color(0xffffffff),
                              shape: BoxShape.circle),
                          child: Center(
                              child: SvgPicture.asset(
                            'assets/icons/check.svg',
                            width: 15,
                            height: 15,
                            color: context
                                    .watch<Page_Controller>()
                                    .post_delete_select
                                    .contains(widget.data.id)
                                ? Color(0xffffffff)
                                : Color(0xFFCCCCCC),
                          )),
                        )
                      : Project_DeadLine(widget.data.data['start_time'])
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  if (widget.data.data['develop_type'].length < 4)
                    for (String text in widget.data.data['develop_type'])
                      Tag_Slot(text)
                  else
                    for (int i = 0; i < 3; i++)
                      Tag_Slot(widget.data.data['develop_type'][i])
                ],
              ),
              Container(
                height: 1,
                margin: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Color(0xFFE6E6E6),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 24,
                child: Row(
                  children: [
                    Text(
                      '${widget.data.data['recruit_number']}명',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      '모집 중',
                      style: TextStyle(
                        color: Color(0xFF020202),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    widget.data.data['like'].contains(
                            context.read<User_Data>().record.record!.id)
                        ? Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/icons/Property 2=Outline, Property 3=heart, Property 4=active.svg',
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/icons/heart.svg',
                              color: Color(0xff999999),
                              fit: BoxFit.cover,
                            ),
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
