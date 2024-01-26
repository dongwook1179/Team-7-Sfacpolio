import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:team_7_sfacpolio/profile_setup_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final pb = PocketBase('http://3.36.50.35:8090');
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController verificationCodeController =
      TextEditingController();
  bool emailSent = false; // 이메일이 보내졌는지 여부 확인
  bool emailVerified = false; // 이메일이 인증되었는지 여부 확인

  Future<void> handleSendEmail() async {
    try {
      print("email : ${emailController.text}");
      await pb.collection('users').requestVerification(
            '${emailController.text}',
          );
      print("이메일 잘 보내짐");
    } catch (e) {
      print('이메일 전송 오류: $e');
    }
  }

  Future<void> handleEmailVerification() async {
    try {
      // 인증번호 확인
      await pb.collection('users').confirmVerification(
            verificationCodeController.text,
          );
      setState(() {
        emailVerified = true;
      });
      print('이메일 인증이 성공했습니다!');
    } catch (e) {
      print('이메일 인증 중 오류 발생: $e');
    }
  }

  // Function to handle the sign-up button press
  Future<void> handleSignUp() async {
    try {
      // Check if password and confirm password match
      if (passwordController.text != confirmPasswordController.text) {
        // Passwords do not match
        print('Passwords do not match.');
        return;
      }

      final body = <String, dynamic>{
        "email": emailController.text,
        "password": passwordController.text,
        "passwordConfirm": confirmPasswordController.text,
        "name": nameController.text,
        "phone": phoneController.text, // 이 부분이 추가되었습니다.
      };

      final record = await pb.collection('users').create(body: body);

      // (optional) send an email verification request
      await pb.collection('users').requestVerification(emailController.text);

      print('Sign-up successful!');
      print('User ID: ${record.id}');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileSetupPage(
            userId: record.id,
            name: nameController.text,
            phone: phoneController.text,
          ),
        ),
      );
    } catch (e) {
      print('Error during sign-up: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up Page'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                  keyboardType: TextInputType.phone,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: '이메일'),
                ),
                ElevatedButton(
                  onPressed: () {
                    handleSendEmail();
                  },
                  child: Text('이메일 보내기'),
                ),
                TextField(
                  controller: verificationCodeController,
                  decoration: InputDecoration(labelText: '인증번호'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    handleSignUp();
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
