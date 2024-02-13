import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LodingbarPage extends StatefulWidget {
  const LodingbarPage({super.key});

  @override
  State<LodingbarPage> createState() => _LodingbarPageState();
}

class _LodingbarPageState extends State<LodingbarPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        child: Column(children: [
          Container(
            width: 360,
            height: 46,
            child: Stack(
              children: [
                Container(
                  width: 328,
                  height: 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFF3F3F3)),
                ),
                Container(
                  width: 82,
                  height: 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF0059FF)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('OOO님에게 맞춘 LOG와 프로젝트가 준비됐어요')],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          CircularProgressIndicator(),
          SizedBox(
            height: 270,
          ),
          Container(
            width: 300,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    elevation: 0,
                    backgroundColor: Color(0xFF0059FF)),
                onPressed: () {},
                child: Text(
                  '알림받기',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                )),
          ),
        ]),
      ),
    );
  }
}
