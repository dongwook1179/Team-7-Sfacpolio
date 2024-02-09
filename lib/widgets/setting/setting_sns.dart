import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:team_7_sfacpolio/widgets/setting/sns_save_dialog.dart';

class Setting_SNS extends StatefulWidget {
  final dynamic data;
  const Setting_SNS(this.data);

  @override
  State<Setting_SNS> createState() => _Setting_SNSState();
}

class _Setting_SNSState extends State<Setting_SNS> {
  bool page_open = false;
  int new_slot = 1;
  Map<String, bool> sns_list = {};
  Map<String, String> sns_list_kor = {
    'email': '이메일',
    'instagram': '인스타그램',
    'github': '깃허브',
    'rocketpunch': '로켓펀치',
    'youtube': '유튜브'
  };
  Map<String, dynamic> data = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List_Updata(widget.data);
  }

  void List_Updata(Map<String, dynamic> datas) {
    sns_list = {
      'email': false,
      'instagram': false,
      'github': false,
      'rocketpunch': false,
      'youtube': false
    };

    for (String sns in sns_list.keys) {
      setState(() {
        if (datas.containsKey(sns)) {
          sns_list[sns] = true;
        } else {
          sns_list[sns] = false;
        }
      });
    }
    for (String sns in datas.keys) {
      if (!sns_list.containsKey(sns)) {
        setState(() {
          sns_list[sns] = true;
        });
      }
    }
    setState(() {
      data = datas;
    });
    print('sns 리스트 확인 ');
    print(sns_list);
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: 360,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  page_open = !page_open;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Color(0xFFE6E6E6)))),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                height: 56,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Text(
                      'SNS 연동 설정',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    page_open
                        ? SvgPicture.asset(
                            'assets/icons/chevron-up.svg',
                            width: 16,
                            height: 16,
                          )
                        : SvgPicture.asset(
                            'assets/icons/chevron-down.svg',
                            width: 16,
                            height: 16,
                          ),
                    SizedBox(
                      width: 8,
                    )
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 150),
              height: page_open ? 57 * sns_list.length.toDouble() + 124 : 0,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (String key in sns_list.keys)
                      Container(
                        width: 300,
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xFFE6E6E6)),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            sns_list_kor.containsKey(key)
                                ? SvgPicture.asset(
                                    'assets/icons/${key}.svg',
                                    width: 24,
                                    height: 24,
                                  )
                                : SvgPicture.asset(
                                    'assets/icons/globe-alt.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                            SizedBox(
                              width: 15,
                            ),
                            sns_list[key]!
                                ? Expanded(
                                    child: Text(
                                      (data[key] ?? ''),
                                      style: TextStyle(
                                        color: Color(0xFF020202),
                                        fontSize: 12,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: TextField(
                                      onChanged: (value) {
                                        if (value.length != 0) {
                                          setState(() {
                                            data[key] = value;
                                          });
                                        } else {
                                          setState(() {
                                            data.remove(key);
                                          });
                                        }
                                        print('입력 완료한 이메일 필드');
                                        print(data);
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: sns_list_kor.containsKey(key)
                                            ? '${sns_list_kor[key]} 계정추가'
                                            : '주소를 입력해주세요',
                                        hintStyle: TextStyle(
                                          color: Color(0xFF7F7F7F),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      style: TextStyle(
                                          color: Color(0xFF4C4C4C),
                                          fontSize: 12,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                          height: 0.1),
                                      maxLines: 1,
                                    ),
                                  ),
                            sns_list[key]!
                                ? GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        sns_list[key] = false;
                                        if (key.contains('etc')) {
                                          sns_list.remove(key);
                                        }
                                        data.remove(key);
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/x-circle.svg',
                                      width: 24,
                                      height: 24,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          sns_list['new_$new_slot'] = false;
                          new_slot++;
                        });
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Color(0xFF0059FF),
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '링크 추가',
                                style: TextStyle(
                                  color: Color(0xFF0059FF),
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              SvgPicture.asset(
                                'assets/icons/plus.svg',
                                color: Color(0xFF0059FF),
                                width: 18,
                                height: 18,
                              )
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await PocketBaseData().Update_SNS(data);
                        Map<String, dynamic> load_data =
                            await PocketBaseData().Get_SNS();
                        List_Updata(load_data);
                        setState(() {
                          page_open = false;
                        });
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Scaffold(
                                body: SNS_Save_Dialog(),
                                backgroundColor:
                                    Color(0xffffffff).withOpacity(0),
                              );
                            });
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xFF0059FF),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            '저장하기',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
