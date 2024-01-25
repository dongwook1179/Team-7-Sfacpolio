import 'package:pocketbase/pocketbase.dart';

class PocketBaseData {
  final pb = PocketBase('http://3.36.50.35:8090');

  void Admin_Access() async {
    final admin =
        await pb.admins.authWithPassword('team_7@ymsco.kr', 'cd080e626k');

    print(pb.authStore.isValid);
    print(pb.authStore.token);
    print(pb.authStore.model.id);
  }

  void User_Access(String email, String password) async {
    final user = await pb.collection('users').authWithPassword(email, password);
  }

  void My_Access() async {
    final authData = await pb
        .collection('users')
        .authWithPassword('modeumi-@naver.com', 'ahemal!556');

    final uid = pb.authStore.model.id;

    final datas = await pb.collection('users').getOne(uid);
    print(pb.authStore.model.id);
    print(datas.getDataValue<String>('email'));
    print(datas.getDataValue<String>('username'));
    print(datas.getDataValue<String>('name'));
    print(datas.getDataValue<String>('avatar'));

    final dummys = await pb.collection('userdata').getOne(uid);

    print(dummys.getDataValue<List>('develop_type'));

    // print(pb.authStore.isValid);
    // print(pb.authStore.token);
    // print(pb.authStore.model.id);
    // print(pb.authStore.model['email']);
  }
}
