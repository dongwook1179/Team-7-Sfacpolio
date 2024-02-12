import 'package:flutter/material.dart';

class MyActive extends StatefulWidget {
  const MyActive({super.key});

  @override
  State<MyActive> createState() => _MyActiveState();
}

class _MyActiveState extends State<MyActive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 360,
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text('관심 게시물'),
              ),
              SizedBox(
                width: 210,
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity(vertical: -4),
                  onPressed: () {},
                  icon: Icon(
                    Icons.navigate_next,
                  )),
            ],
          ),
          Divider(
            color: Color(0xFFF3F3F3),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('최근 본 게시물'),
              ),
              SizedBox(
                width: 190,
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity(vertical: -4),
                  onPressed: () {},
                  icon: Icon(
                    Icons.navigate_next,
                  )),
            ],
          ),
          Divider(
            color: Color(0xFFF3F3F3),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('내 게시물'),
              ),
              SizedBox(
                width: 220,
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity(vertical: -4),
                  onPressed: () {},
                  icon: Icon(
                    Icons.navigate_next,
                  )),
            ],
          ),
          Divider(
            color: Color(0xFFF3F3F3),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('내가 쓴 댓글'),
              ),
              SizedBox(
                width: 205,
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity(vertical: -4),
                  onPressed: () {},
                  icon: Icon(
                    Icons.navigate_next,
                  )),
            ],
          ),
          Divider(
            color: Color(0xFFF3F3F3),
          ),
        ]),
      ),
    );
  }
}
