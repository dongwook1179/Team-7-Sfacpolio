import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/profileedit/profileedit_service_select.dart';

class Profile_Edit_Service extends StatefulWidget {
  final String text;
  final bool state;
  const Profile_Edit_Service(this.text, this.state);

  @override
  State<Profile_Edit_Service> createState() => _Profile_Edit_ServiceState();
}

class _Profile_Edit_ServiceState extends State<Profile_Edit_Service> {
  String develop_text = '';

  BoxDecoration boxdeco = BoxDecoration(
    border: Border.all(width: 1, color: Color(0xFFCCCCCC)),
    borderRadius: BorderRadius.circular(8),
  );

  TextStyle textst = TextStyle(
    color: Color(0xFF999999),
    fontSize: 14,
    fontFamily: 'Pretendard',
    fontWeight: FontWeight.w400,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      develop_text = widget.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IntrinsicWidth(
          child: Container(
            height: 45,
            child: GestureDetector(
              onTap: () async {
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Profile_Edit_Service_Select(develop_text);
                  },
                ).then((value) => setState(() {
                      context.read<User_Data>().Service_Delete(widget.text);
                      context.read<User_Data>().Service_Save(value);
                      develop_text = value;
                    }));
              },
              child: Container(
                height: 45,
                width: 270,
                padding: EdgeInsets.all(12),
                decoration: boxdeco,
                child: Row(
                  children: [
                    develop_text != ''
                        ? Text(
                            develop_text,
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : Text('선택해주세요', style: textst),
                    Spacer(),
                    SvgPicture.asset(
                      'assets/icons/chevron-down.svg',
                      width: 16,
                      height: 16,
                      color: Color(0xff333333),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        widget.state
            ? GestureDetector(
                onTap: () {
                  context.read<User_Data>().Service_Delete(develop_text);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 6),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Color(0xFF0059FF),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      '삭제',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
