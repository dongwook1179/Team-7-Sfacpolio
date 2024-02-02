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

  Future<Map<String, dynamic>> Dummy() async {
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
}
