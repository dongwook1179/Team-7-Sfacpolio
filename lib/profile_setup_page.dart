// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:dio/dio.dart';
import 'package:team_7_sfacpolio/signup_onboarding_connection_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileSetupPage(
        userId: '',
        name: '',
      ),
    );
  }
}

class ProfileSetupPage extends StatefulWidget {
  final String userId;
  final String name;
  const ProfileSetupPage({
    Key? key,
    required this.userId,
    required this.name,
  }) : super(key: key);

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  late File _image;
  TextEditingController _usernameController = TextEditingController();
  final pb = PocketBase('http://3.36.50.35:8090');

  @override
  void initState() {
    super.initState();
    _image = File(""); // 기본적으로 빈 이미지 파일을 설정합니다.
    print('User ID from sign-up: ${widget.userId}');
  }

  Future<void> _capturePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadData() async {
    print('닉네임: ${_usernameController.text}');
    print('아바타: ${_image.uri}');
    print('사용자 ID: ${widget.userId}');

    try {
      Dio dio = Dio();

      // FormData 생성
      FormData formData = FormData.fromMap({
        'username': _usernameController.text,
      });

      // 이미지 파일 업로드
      FormData imageFormData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(
          _image.path,
          filename: _image.path.split('/').last,
        ),
      });

      // POST 요청 보내기
      Response response = await dio.patch(
        'http://3.36.50.35:8090/api/collections/users/records/${widget.userId}',
        data: formData,
      );

      Response imageResponse = await dio.patch(
        'http://3.36.50.35:8090/api/collections/users/records/${widget.userId}',
        data: imageFormData,
      );

      // 응답 확인
      if (response.statusCode == 200) {
        print('데이터 업로드 성공!');
      } else {
        print('데이터 업로드 오류. 상태 코드: ${response.statusCode}');
      }
      if (imageResponse.statusCode == 200) {
        print('이미지 업로드 성공!');
      } else {
        print('이미지 업로드 오류. 상태 코드: ${imageResponse.statusCode}');
      }
    } catch (e) {
      print('전부 업로드 오류: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 97,
              ),
              Text(
                '프로필 설정',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '나를 나타내는 프로필 사진과 닉네임을 설정하세요',
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  _showBottomSheet();
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _image.existsSync() ? null : Color(0xFFD9D9D9),
                    image: _image.existsSync()
                        ? DecorationImage(
                            image: FileImage(_image),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: _image.existsSync() ? null : Icon(Icons.camera),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "닉네임",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: '닉네임',
                      hintStyle: TextStyle(
                        color: Color(0xFFB3B3B3),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    )),
              ),
              SizedBox(
                height: 205,
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupOnboardingConnectionPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '건너뛰기',
                      style: TextStyle(
                        color: Color(0xFF747474),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () async {
                    await _uploadData(); // 닉네임 업데이트
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0059FF),
                    foregroundColor: Color(0xFF0059FF),
                    fixedSize: Size(300, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      '다음',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
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
        ),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: 360,
          height: 164,
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35),
              Text(
                '사진 업데이트',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  _capturePhoto();
                },
                child: Row(
                  children: [
                    Icon(Icons.camera),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '사진 찍기',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: Row(
                  children: [
                    Icon(Icons.access_alarms_outlined),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '내 사진에서 선택',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
