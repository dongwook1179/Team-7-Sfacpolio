import 'package:dio/dio.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:team_7_sfacpolio/screen/commuitypage.dart';

class PocketBaseData {
  final pb = PocketBase('http://3.36.50.35:8090');
  final dio = Dio();

  // 개발언어 컬렉션 데이터 불러오기
  Future<Map<String, dynamic>> Load_Data() async {
    final collection_data = await pb.collection('language_list').getFullList(
          sort: '-created',
        );

    Map<String, dynamic> data_conversion = {};

    for (int i = 0; i < collection_data.length; i++) {
      final url = pb.files
          .getUrl(collection_data[i], collection_data[i].data['logo'])
          .toString();
      data_conversion[collection_data[i].data['language']] = {
        'logo': url,
        'search': collection_data[i].data['search']
      };
    }
    return data_conversion;
  }

  Future<String> Default_Image() async {
    final collection_data =
        await pb.collection('language_list').getOne('w0un8wzzjwp6sgt');
    final url = pb.files
        .getUrl(collection_data, collection_data.data['logo'])
        .toString();
    return url;
  }

  Future<List<String>> Develop_Load() async {
    final collection_data =
        await pb.collection('develop_type_list').getFullList();
    List<String> data_conversion = [];
    for (int i = 0; i < collection_data.length; i++) {
      data_conversion.add(collection_data[i].data['develop_type']);
    }
    return data_conversion;
  }

  Future<Map<String, dynamic>> Service_Load() async {
    final collection_data = await pb.collection('service_list').getFullList();
    Map<String, dynamic> data_conversion = {};
    for (int i = 0; i < collection_data.length; i++) {
      final url = pb.files
          .getUrl(collection_data[i], collection_data[i].data['image'])
          .toString();
      data_conversion[collection_data[i].data['service']] = {
        'image': url,
        'image_name': collection_data[i].data['image_name']
      };
    }
    return data_conversion;
  }

  Future<Map<String, dynamic>> Commuity() async {
    final collection_data = await pb.collection('community').getFullList(
          sort: '-created',
        );

    Map<String, dynamic> data_conversion = {};
    List<String> url = [];
    for (int i = 0; i < collection_data.length; i++) {
      for (String name in collection_data[i].data['image']) {
        String image = pb.files.getUrl(collection_data[i], name).toString();
        url.add(image);
      }

      data_conversion[collection_data[i].id] = {
        'user_id': collection_data[i].data['user_id'],
        'topic': collection_data[i].data['topic'],
        'image': url,
        'title': collection_data[i].data['title'],
        'content': collection_data[i].data['content'],
        'created': collection_data[i].created,
        'updated': collection_data[i].updated,
        'id': collection_data[i].id,
      };
    }
    print(collection_data);
    print(data_conversion);
    return data_conversion;
  }

  Future<void> Dummy_2() async {
    final record = await pb.collection('users').getOne(
          'ty52e7fdm9b1sj6',
          expand: 'relField1,relField2.subRelField',
        );
    print(record);
    print(record.data['verified']);
  }

  Future<Map<String, dynamic>> Get_Log() async {
    Map<String, dynamic> return_data = {};
    final record_log = await pb.collection('log').getFullList();
    final record_lan = await pb.collection('log_language').getFullList();
    final record_dev = await pb.collection('log_develop_tpye').getFullList();
    final record_like = await pb.collection('log_like').getFullList();
    final record_view = await pb.collection('log_view').getFullList();
    final record_com = await pb.collection('log_comment').getFullList();

    for (var data in record_log) {
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
        print('비교');
        print(data.id);
        print(data_like.data['log_id']);
        if (data_like.data['log_id'] == data.id) {
          print('진입 확인');
          return_data[data.id]['like'].add(data_like.id);
        }
      }

      for (var data_view in record_view) {
        print('비교');
        print(data.id);
        print(data_view.data['log_id']);
        if (data_view.data['log_id'] == data.id) {
          print('진입 확인');
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

      return_data[data.id]['type'] = 'log';
      final user = await pb.collection('users').getOne(data.data['user_id']);
      String user_image = pb.files.getUrl(user, user.data['avatar']).toString();
      return_data[data.id]['avatar'] = user_image;
      return_data[data.id]['writer'] = user.data['nickname'];
      if (data.data['type'] == '포트폴리오') {
        return_data[data.id]['type'] = 'LOG';
      } else {
        return_data[data.id]['type'] = data.data['type'];
      }
      String image = pb.files.getUrl(data, data.data['image']).toString();
      return_data[data.id]['image'] = image;
      return_data[data.id]['title'] = data.data['title'];
      return_data[data.id]['content'] = data.data['content'];
      return_data[data.id]['update'] = data.updated;
    }
    print(return_data);
    return return_data;
  }

  Future<Map<String, dynamic>> Data_Filter(
      String text, Map<String, dynamic> condition) async {
    Map<String, dynamic> datas = await Get_Log();
    Map<String, dynamic> filter_data = {};
    for (String data in datas.keys) {
      if (condition.isNotEmpty) {
        if ((condition['제목'] ?? false) && datas[data]['title'].contains(text)) {
          filter_data[data] = datas[data];
        }
        if ((condition['내용'] ?? false) &&
            datas[data]['content'].contains(text)) {
          filter_data[data] = datas[data];
        }
        if ((condition['작성자'] ?? false) &&
            datas[data]['writer'].contains(text)) {
          filter_data[data] = datas[data];
        }
        // if ((condition['작성자'] ?? false) &&
        //     datas[data]['comment'].contains(text)) {
        //   filter_data[data] = datas[data];
        // }
        if ((condition['Log'] ?? false) && datas[data]['type'].contains(text)) {
          filter_data[data] = datas[data];
        }
        if ((condition['커뮤니티'] ?? false) &&
            datas[data]['type'].contains(text)) {
          filter_data[data] = datas[data];
        }
        if ((condition['프로젝트'] ?? false) &&
            datas[data]['type'].contains(text)) {
          filter_data[data] = datas[data];
        }
        if ((condition['내 게시물'] ?? false) &&
            datas[data]['type'].contains(text)) {
          filter_data[data] = datas[data];
        }
        if (condition.containsKey('tag')) {
          for (String tag in condition['tag']) {
            if (datas[data]['develop_type'].contains(tag)) {
              filter_data[data] = datas[data];
            }
            if (datas[data]['develop_type'].contains(tag)) {
              filter_data[data] = datas[data];
            }
          }
        }
      } else {
        if (datas[data]['title'].contains(text)) {
          filter_data[data] = datas[data];
        }
      }
    }
    return filter_data;
  }

  // Future<void> Get_Follow(String user_id) async { // 해당부분 로그인 연결후 본인 id 가져오도록 설계
  Future<Map<String, dynamic>> Get_Follow() async {
    final record = await pb.collection('follow').getFullList();
    String user_id = 'modeumi19950804'; //  해당부분 로그인 연결후 본인 id 가져오도록 설계
    Map<String, dynamic> follow = {'follower': [], 'following': []};
    for (var data in record) {
      if (data.data['following'] == user_id) {
        final follower_data =
            await pb.collection('users').getOne(data.data['follower']);
        String image = pb.files
            .getUrl(follower_data, follower_data.data['avatar'])
            .toString();
        print(follower_data);
        Map<String, dynamic> follower = {
          'my_id': user_id,
          'id': data.data['follower'],
          'image': image,
          'nickname': follower_data.data['nickname'],
          'email': follower_data.data['email'],
        };
        follow['follower'].add(follower);
      }

      if (data.data['follower'] == user_id) {
        final following_data =
            await pb.collection('users').getOne(data.data['following']);
        String image = pb.files
            .getUrl(following_data, following_data.data['avatar'])
            .toString();
        Map<String, dynamic> follower = {
          'my_id': user_id,
          'id': data.data['following'],
          'image': image,
          'nickname': following_data.data['nickname'],
          'email': following_data.data['email'],
        };
        follow['following'].add(follower);
      }
    }
    print('팔로워 목록');
    print(follow['follower']);
    print('팔로잉 목록');
    print(follow['following']);
    return follow;
  }

  Future<void> Delete_Follow(
      String type, String target_id, String performer_id) async {
    final record = await pb.collection('follow').getFullList();
    if (type == 'follower') {
      for (var data in record) {
        if (data.data['following'] == target_id &&
            data.data['follower'] == performer_id) {
          print('삭제 대상');
          print(data);
          await pb.collection('follow').delete(data.id);
        }
      }
    } else if (type == 'following') {
      for (var data in record) {
        if (data.data['follower'] == target_id &&
            data.data['following'] == performer_id) {
          print('삭제 대상');
          print(data);
          await pb.collection('follow').delete(data.id);
        }
      }
    }
  }
}
