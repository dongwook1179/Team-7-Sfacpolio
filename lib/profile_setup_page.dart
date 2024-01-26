// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:dio/dio.dart';

class ProfileSetupPage extends StatefulWidget {
  final String userId;
  final String name;
  final String phone;
  const ProfileSetupPage({
    Key? key,
    required this.userId,
    required this.name,
    required this.phone,
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('프로필 설정 페이지'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text("프로필 설정"),
                Text("나를 나타내는 프로필 사진과 닉네임을 설정하세요"),
                GestureDetector(
                  onTap: _pickImage,
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
                    child: _image.existsSync()
                        ? null
                        : Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: Colors.white,
                          ),
                  ),
                ),
                TextField(
                  controller: _usernameController,
                  decoration:
                      InputDecoration(labelText: '닉네임', hintText: "닉네임 입력"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await _uploadData(); // 닉네임 업데이트
                  },
                  child: Text('데이터 업로드'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
