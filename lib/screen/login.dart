// import 'package:pocketbase/pocketbase.dart';

// void main() async {
//   final pb = PocketBase('http://3.36.50.35:8090');

//   // Replace 'YOUR_USERNAME_OR_EMAIL' and '1234567890' with actual login credentials
//   final authData = await pb
//       .collection('users')
//       .authWithPassword('ohjeonghyun', '#qwe486486#');

//   // Check if the authentication was successful
//   if (pb.authStore.isValid) {
//     print('Authentication successful');
//     print('Token: ${pb.authStore.token}');
//     print('User ID: ${pb.authStore.model.id}');
//   } else {
//     print('Authentication failed');
//   }

//   // "logout" the last authenticated model
//   pb.authStore.clear();
// }
