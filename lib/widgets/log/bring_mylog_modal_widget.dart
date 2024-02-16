import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:team_7_sfacpolio/pocketbase/data.dart';
import 'package:team_7_sfacpolio/provider/userdata.dart';
import 'package:provider/provider.dart';

import 'package:team_7_sfacpolio/widgets/log/log_card_widget.dart';
import 'package:team_7_sfacpolio/widgets/mypost/mylog_slot_build.dart';
import 'package:team_7_sfacpolio/widgets/mypost/mypost_body.dart';

Future<void> BringMyLogModalWidget(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: 328,
            child: BringMyLogCustomDialog(), // 커스텀 다이얼로그 위젯 사용
          ),
        ),
      );
    },
  );
}

class BringMyLogCustomDialog extends StatefulWidget {
  @override
  _BringMyLogCustomDialogState createState() => _BringMyLogCustomDialogState();
}

class _BringMyLogCustomDialogState extends State<BringMyLogCustomDialog> {
  final pb =
      PocketBase('https://iooykz0o87.execute-api.ap-northeast-2.amazonaws.com');

  Future<Map<String, dynamic>> Get_My_Log(String user_id) async {
    Map<String, dynamic> return_data = {};
    final record_log =
        await pb.collection('log').getList(filter: " user_id = '$user_id' ");
    final record_lan = await pb.collection('log_language').getFullList();
    final record_dev = await pb.collection('log_develop_type').getFullList();
    final record_like = await pb.collection('log_like').getFullList();
    final record_view = await pb.collection('log_view').getFullList();
    final record_com = await pb.collection('log_comment').getFullList();

    for (var data in record_log.items) {
      return_data[data.id] = {};
      return_data[data.id]['language'] = [];
      return_data[data.id]['develop_type'] = [];
      return_data[data.id]['like'] = [];
      return_data[data.id]['view'] = [];
      return_data[data.id]['comment'] = {};

      for (var data_lan in record_lan) {
        //로그 id 에 맞는 언어 가져오기
        if (data_lan.data['log_id'] == data.id) {
          // 언어가 멀티플이므로 반복문을 통해
          for (var language_id in data_lan.data['language_id']) {
            final language =
                await pb.collection('language_list').getOne(language_id);
            return_data[data.id]['language'].add(language.data['language']);
          }
        }
      }
      for (var data_dev in record_dev) {
        if (data_dev.data['log_id'] == data.id) {
          for (var develop_id in data_dev.data['develop_type_id']) {
            final develop_type =
                await pb.collection('develop_type_list').getOne(develop_id);
            return_data[data.id]['develop_type']
                .add(develop_type.data['develop_type']);
          }
        }
      }

      for (var data_like in record_like) {
        if (data_like.data['log_id'] == data.id) {
          return_data[data.id]['like'].add(data_like.id);
        }
      }

      for (var data_view in record_view) {
        if (data_view.data['log_id'] == data.id) {
          return_data[data.id]['view'].add(data_view.id);
        }
      }
      for (var data_com in record_com) {
        if (data_com.data['log_id'] == data.id) {
          return_data[data.id]['comment'] = [
            {
              'user': data_com.data['user_id'],
              'content': data_com.data['content']
            }
          ];
        }
      }
      return_data[data.id]['comment_num'] =
          return_data[data.id]['comment'].length;
      return_data[data.id]['view_num'] = return_data[data.id]['view'].length;
      return_data[data.id]['like_num'] = return_data[data.id]['like'].length;
      return_data[data.id]['id'] = data.id;
      return_data[data.id]['type'] = 'Log';
      final user = await pb.collection('users').getOne(data.data['user_id']);
      String user_image = pb.files.getUrl(user, user.data['avatar']).toString();
      return_data[data.id]['avatar'] = user_image;
      return_data[data.id]['writer'] = user.data['nickname'];

      String image = pb.files.getUrl(data, data.data['image']).toString();
      return_data[data.id]['image'] = image;
      return_data[data.id]['title'] = data.data['title'];
      return_data[data.id]['content'] = data.data['content'];
      return_data[data.id]['update'] = data.updated;
    }
    return return_data;
  }

  bool page_load = false;
  Map<String, dynamic> data = {};
  void Get_Data() async {
    String id = context.read<User_Data>().record.record!.id;

    Map<String, dynamic> get_data = await PocketBaseData().Get_My_Log(id);

    setState(() {
      data = get_data;
      page_load = true;
    });
    print(data);
  }

  @override
  void initState() {
    super.initState();
    Get_Data();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 700,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '마이로그 가져오기',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF020202),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Container(
            width: 280,
            height: 1,
            decoration: BoxDecoration(color: Color(0xFF020202)),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              '자신의 프로젝트에 추가하고 싶은 로그를 선택해주세요.',
              style: TextStyle(
                color: Color(0xFF020202),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 144,
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF0059FF)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '취소',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF0059FF),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 144,
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: Color(0xFF0059FF),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF0059FF)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '적용',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 1, 0, 0),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
