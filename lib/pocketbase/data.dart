import 'package:dio/dio.dart';
import 'package:pocketbase/pocketbase.dart';

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
    final record = await pb
        .collection('follow')
        .getList(filter: "( following ='dhwjdgus9708010' )");
    print(record.items);
    for (var data in record.items) {
      print(data.data['follower']);
    }
    print(record.items[0].data['following']);
  }

  Future<Map<String, dynamic>> Get_Log() async {
    Map<String, dynamic> return_data = {};
    final record_log = await pb.collection('log').getFullList();
    final record_lan = await pb.collection('log_language').getFullList();
    final record_dev = await pb.collection('log_develop_type').getFullList();
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
    return follow;
  }

  Future<void> Delete_Follow(
      String type, String target_id, String performer_id) async {
    final record = await pb.collection('follow').getFullList();
    if (type == 'follower') {
      for (var data in record) {
        if (data.data['following'] == target_id &&
            data.data['follower'] == performer_id) {
          await pb.collection('follow').delete(data.id);
        }
      }
    } else if (type == 'following') {
      for (var data in record) {
        if (data.data['follower'] == target_id &&
            data.data['following'] == performer_id) {
          await pb.collection('follow').delete(data.id);
        }
      }
    }
  }

  Future<void> Withdraw(String user_id) async {
    await pb.collection('users').delete(user_id);
  }

  Future<Map<String, dynamic>> Get_Community() async {
    Map<String, dynamic> return_data = {};
    final record_log = await pb.collection('community').getFullList();
    final record_lan = await pb.collection('community_language').getFullList();
    final record_dev =
        await pb.collection('community_develop_type').getFullList();
    final record_like = await pb.collection('community_like').getFullList();
    final record_view = await pb.collection('community_view').getFullList();
    final record_com = await pb.collection('community_comment').getFullList();

    for (var data in record_log) {
      return_data[data.id] = {};
      return_data[data.id]['language'] = [];
      return_data[data.id]['develop_type'] = [];
      return_data[data.id]['like'] = [];
      return_data[data.id]['view'] = [];
      return_data[data.id]['comment'] = [];

      for (var data_lan in record_lan) {
        if (data_lan.data['community_id'] == data.id) {
          for (var language_id in data_lan.data['language_id']) {
            final language =
                await pb.collection('language_list').getOne(language_id);
            return_data[data.id]['language'].add(language.data['language']);
          }
        }
      }
      for (var data_dev in record_dev) {
        if (data_dev.data['community_id'] == data.id) {
          for (var develop_id in data_dev.data['develop_type_id']) {
            final develop_type =
                await pb.collection('develop_type_list').getOne(develop_id);
            return_data[data.id]['develop_type']
                .add(develop_type.data['develop_type']);
          }
        }
      }

      for (var data_like in record_like) {
        if (data_like.data['community_id'] == data.id) {
          return_data[data.id]['like'].add(data_like.id);
        }
      }

      for (var data_view in record_view) {
        if (data_view.data['community_id'] == data.id) {
          return_data[data.id]['view'].add(data_view.id);
        }
      }
      for (var data_com in record_com) {
        if (data_com.data['community_id'] == data.id) {
          return_data[data.id]['comment'].add({
            'user': data_com.data['user_id'],
            'content': data_com.data['content']
          });
        }
      }
      return_data[data.id]['comment_num'] =
          return_data[data.id]['comment'].length;
      return_data[data.id]['view_num'] = return_data[data.id]['view'].length;
      return_data[data.id]['like_num'] = return_data[data.id]['like'].length;
      return_data[data.id]['id'] = data.id;
      return_data[data.id]['type'] = 'community';
      final user = await pb.collection('users').getOne(data.data['user_id']);
      String user_image = pb.files.getUrl(user, user.data['avatar']).toString();
      return_data[data.id]['avatar'] = user_image;
      return_data[data.id]['writer'] = user.data['nickname'];
      if (data.data['type'] == '포트폴리오') {
        return_data[data.id]['type'] = 'LOG';
      }
      return_data[data.id]['image'] = [];
      for (var image in data.data["image"]) {
        String url = pb.files.getUrl(data, image).toString();
        return_data[data.id]['image'].add(url);
      }
      return_data[data.id]['title'] = data.data['title'];
      return_data[data.id]['content'] = data.data['content'];
      return_data[data.id]['update'] = data.updated;
    }
    return return_data;
  }

  // Future<void> Get_MyComment(String user_id) async {
  Future<Map<String, dynamic>> Get_MyComment() async {
    Map<String, dynamic> comment = {};
    final record_lc = await pb
        .collection('log_comment')
        .getList(filter: "( user_id ='modeumi19950804' )");
    final record_lrc = await pb
        .collection('log_recomment')
        .getList(filter: "( user_id ='modeumi19950804' )");
    final record_cc = await pb
        .collection('community_comment')
        .getList(filter: "( user_id ='modeumi19950804' )");
    final record_crc = await pb
        .collection('community_recomment')
        .getList(filter: "( user_id ='modeumi19950804' )");

    for (var data in record_lc.items) {
      final like = await pb
          .collection('log_comment_like')
          .getList(filter: "( comment_id ='${data.id}' )");

      Map<String, dynamic> datas = {
        'id': data.id,
        'user_id': data.data['user_id'],
        'content': data.data['content'],
        'update': data.updated,
        'like': like.items,
        'like_num': like.items.length,
        'type': '로그'
      };
      comment[data.id] = datas;
    }
    for (var data in record_lrc.items) {
      final like = await pb
          .collection('log_recomment_like')
          .getList(filter: "( recomment_id ='${data.id}' )");

      Map<String, dynamic> datas = {
        'id': data.id,
        'user_id': data.data['user_id'],
        'content': data.data['content'],
        'update': data.updated,
        'like': like.items,
        'like_num': like.items.length,
        'type': '로그'
      };
      comment[data.id] = datas;
    }

    for (var data in record_cc.items) {
      final like = await pb
          .collection('community_comment_like')
          .getList(filter: "( comment_id ='${data.id}' )");

      Map<String, dynamic> datas = {
        'id': data.id,
        'user_id': data.data['user_id'],
        'content': data.data['content'],
        'update': data.updated,
        'like': like.items,
        'like_num': like.items.length,
        'type': '커뮤니티'
      };
      comment[data.id] = datas;
    }
    for (var data in record_crc.items) {
      final like = await pb
          .collection('community_recomment_like')
          .getList(filter: "( recomment_id ='${data.id}' )");
      Map<String, dynamic> datas = {
        'id': data.id,
        'user_id': data.data['user_id'],
        'content': data.data['content'],
        'update': data.updated,
        'like': like.items,
        'like_num': like.items.length,
        'type': '커뮤니티'
      };
      comment[data.id] = datas;
    }

    return comment;
  }

  Future<Map<String, dynamic>> Get_MyPost() async {
    Map<String, dynamic> datas = {};
    final community = await pb
        .collection('community')
        .getList(filter: "( user_id ='modeumi19950804' )");
    final log = await pb
        .collection('log')
        .getList(filter: "( user_id ='modeumi19950804' )");
    final project = await pb
        .collection('project')
        .getList(filter: "( user_id ='modeumi19950804' )");

    for (var data in community.items) {
      if (!datas.containsKey('community')) {
        datas['community'] = [];
      }
      Map<String, dynamic> information = await Post_information(data);
      for (String key in information.keys) {
        data.data[key] = information[key];
      }
      datas['community'].add(data);
      // print('커뮤니티 정보확인');
      // print(data);
    }

    for (var data in log.items) {
      if (!datas.containsKey('log')) {
        datas['log'] = [];
      }
      Map<String, dynamic> information = await Post_information(data);
      for (String key in information.keys) {
        data.data[key] = information[key];
      }
      datas['log'].add(data);
      // print('로그 정보확인');
      // print(data);
    }

    for (var data in project.items) {
      if (!datas.containsKey('project')) {
        datas['project'] = [];
      }
      Map<String, dynamic> information = await Project_information(data);
      for (String key in information.keys) {
        data.data[key] = information[key];
      }
      datas['project'].add(data);
      print('프로젝트 정보확인');
      print(data);
    }
    return datas;
  }

  Future<Map<String, dynamic>> Project_information(
      RecordModel recordModel) async {
    Map<String, dynamic> project_information = {};
    List<String> develop_list = [];
    List<String> language_list = [];

    final develop_type = await pb
        .collection('project_develop_type')
        .getList(filter: "( project_id ='${recordModel.id}' )");
    for (var data in develop_type.items) {
      for (String id in data.data['develop_type_id']) {
        final develop_types =
            await pb.collection('develop_type_list').getOne(id);
        develop_list.add(develop_types.data['develop_type']);
      }
    }
    project_information['develop_type'] = develop_list;

    final language = await pb
        .collection('project_language')
        .getList(filter: "( project_id ='${recordModel.id}' )");
    for (var data in language.items) {
      for (String id in data.data['language_id']) {
        final languages = await pb.collection('language_list').getOne(id);
        language_list.add(languages.data['language']);
      }
    }

    project_information['language'] = language_list;

    final users = await pb
        .collection('users')
        .getList(filter: "( id ='${recordModel.data['user_id']}' )");
    for (var data in users.items) {
      project_information['nickname'] = data.data['nickname'];
      project_information['email'] = data.data['email'];
      project_information['user_id'] = data.id;
      final avatar_url = pb.files.getUrl(data, data.data['avatar']).toString();
      project_information['avatar'] = avatar_url;
    }

    return project_information;
  }

  Future<Map<String, dynamic>> Post_information(RecordModel recordModel) async {
    String collectionname = recordModel.collectionName;
    String recordid = recordModel.id;
    String userid = recordModel.data['user_id'];
    List<dynamic> recomment_list = [];
    List<dynamic> develop_list = [];
    List<dynamic> language_list = [];
    List<String> image_list = [];

    Map<String, dynamic> post_information = {};

    final comment = await pb
        .collection('${collectionname}_comment')
        .getList(filter: "( ${collectionname}_id ='${recordid}' )");
    for (var item in comment.items) {
      final recomment = await pb
          .collection('${collectionname}_recomment')
          .getList(filter: "( comment_id = '${item.id}' )");
      for (var item2 in recomment.items) {
        recomment_list.add(item2);
      }
    }
    final like = await pb
        .collection('${collectionname}_like')
        .getList(filter: "( ${collectionname}_id ='${recordid}' )");
    final view = await pb
        .collection('${collectionname}_like')
        .getList(filter: "( ${collectionname}_id ='${recordid}' )");

    final develop_type = await pb
        .collection('${collectionname}_develop_type')
        .getList(filter: "( ${collectionname}_id ='${recordid}' )");

    for (var data in develop_type.items) {
      for (String id in data.data['develop_type_id']) {
        final develop_types =
            await pb.collection('develop_type_list').getOne(id);
        develop_list.add(develop_types.data['develop_type']);
      }
    }

    final language = await pb
        .collection('${collectionname}_language')
        .getList(filter: "( ${collectionname}_id ='${recordid}' )");

    for (var data in language.items) {
      for (String id in data.data['language_id']) {
        final languages = await pb.collection('language_list').getOne(id);
        language_list.add(languages.data['language']);
      }
    }

    final users =
        await pb.collection('users').getList(filter: "( id ='${userid}' )");
    for (var data in users.items) {
      post_information['nickname'] = data.data['nickname'];
      post_information['email'] = data.data['email'];
      post_information['user_id'] = data.id;
      final avatar_url = pb.files.getUrl(data, data.data['avatar']).toString();
      post_information['avatar'] = avatar_url;
    }
    if (recordModel.data['image'].runtimeType == List<dynamic>) {
      for (var image in recordModel.data['image']) {
        final image_url = pb.files.getUrl(recordModel, image).toString();
        image_list.add(image_url);
        post_information['image'] = image_list;
      }
    } else {
      final image_url =
          pb.files.getUrl(recordModel, recordModel.data['image']).toString();
      post_information['image'] = image_url;
    }

    post_information['develop_type'] = develop_list;
    post_information['language'] = language_list;
    post_information['comment'] = comment.items;
    post_information['recomment'] = recomment_list;
    post_information['like'] = like.items;
    post_information['view'] = view.items;

    return post_information;
  }

  Future<void> Set_UserData(String user_id, Map<String, dynamic> data) async {
    print('받은 데이터 ');
    print(user_id);
    print(data);
    data.forEach((key, value) {
      print(data[key]);
    });

    if (data.containsKey('develop')) {
      List<String> develop_type_list = [];
      for (String key in data['develop']) {
        final develop = await pb
            .collection('develop_type_list')
            .getList(filter: " develop_type =  '${key}' ");
        for (var item in develop.items) {
          develop_type_list.add(item.id);
        }
      }
      final body = <String, dynamic>{
        "user_id": user_id,
        "develop_type_id": develop_type_list
      };
      await pb.collection('develop_type').create(body: body);
    }

    if (data.containsKey('language')) {
      List<String> language_list = [];
      for (String key in data['language']) {
        final language = await pb
            .collection('language_list')
            .getList(filter: " language =  '${key}' ");
        if (language.items.length == 0) {
          final body = <String, dynamic>{
            "user_id": user_id,
            "language": key,
          };
          await pb.collection('language_custom').create(body: body);
        } else {
          for (var item in language.items) {
            language_list.add(item.id);
          }
        }
      }
      final body = <String, dynamic>{
        "user_id": "${user_id}",
        "language_id": language_list
      };

      await pb.collection('language').create(body: body);
    }

    if (data.containsKey('career_type') &&
        data.containsKey('career_company') &&
        data.containsKey('career_period')) {
      String type = '';
      if (data['career_type'][0] == '신입입니다') {
        type = 'education';
      } else if (data['career_type'][0] == '경력자입니다') {
        type = 'company';
      }
      final body = <String, dynamic>{
        "user_id": "${user_id}",
        "type": type,
        "company": data['career_company'][0],
        "period": data['career_period'][0],
      };

      await pb.collection('career').create(body: body);
    }

    if (data.containsKey('condition_type') &&
        data.containsKey('condition_period')) {
      String type = '';
      if (data['condition_type'][0] == '온라인') {
        type = 'online';
      } else if (data['condition_type'][0] == '오프라인') {
        type = 'offline';
      }
      final body = <String, dynamic>{
        "work_type": type,
        "preferred_project_period": data['condition_period'][0]
      };
      await pb.collection('users').update(user_id, body: body);
    }

    if (data.containsKey('service')) {
      List<String> service_list = [];

      for (String key in data['service']) {
        final language = await pb
            .collection('service_list')
            .getList(filter: " service =  '${key}' ");
        for (var item in language.items) {
          service_list.add(item.id);
        }
      }
      final body = <String, dynamic>{
        "user_id": user_id,
        "service": service_list
      };
      await pb.collection('service').create(body: body);
    }

    if (data.containsKey('mbti')) {
      final body = <String, dynamic>{
        "mbti": data['mbti'][0],
      };
      await pb.collection('users').update(user_id, body: body);
    }
  }

  // Future<void> Get_SNS(String user_id) async{
  Future<Map<String, dynamic>> Get_SNS() async {
    Map<String, dynamic> sns_list = {};
    int etc_count = 1;
    // final sns = await pb
    //     .collection('sns')
    //     .getList(filter: " user_id =  '${user_id}' ");
    final sns = await pb
        .collection('sns')
        .getList(filter: " user_id =  'oe2f8x7krb4rwsb' ");

    for (var data in sns.items) {
      if (data.data['type'] == 'etc') {
        sns_list['${data.data['type']}_$etc_count'] = data.data['account'];
        etc_count++;
      } else {
        sns_list[data.data['type']] = data.data['account'];
      }
    }
    return sns_list;
  }

  // Future<void> Delete_SNS(String user_id,String account) async{
  Future<void> Delete_SNS(String account) async {
    // final sns = await pb
    //     .collection('sns')
    //     .getList(filter: " user_id =  '${user_id}', account = '${account}' ");

    final sns = await pb.collection('sns').getList(
        filter: " user_id =  'oe2f8x7krb4rwsb'&& account = '${account}' ");
    String id = sns.items[0].id;
    await pb.collection('sns').delete(id);
  }

  // Future<void> Update_SNS(String user_id, Map<String,dynamic> data) async{
  Future<void> Update_SNS(Map<String, dynamic> data) async {
    final sns = await pb
        .collection('sns')
        .getList(filter: " user_id =  'oe2f8x7krb4rwsb' ");
    for (var item in sns.items) {
      Delete_SNS(item.data['account']);
    }
    for (String type in data.keys) {
      String account = data[type];
      print('저장 정보 확인');
      print(type);
      print(account);
      if (type.contains('etc') || type.contains('new')) {
        type = 'etc';
      }
      final body = <String, dynamic>{
        // "user_id": user_id,
        "user_id": "oe2f8x7krb4rwsb",
        "type": type,
        "account": account
      };
      print('바디 상태 확인');
      print(body);
      await pb.collection('sns').create(body: body);
    }
  }
}
