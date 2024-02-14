import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_7_sfacpolio/provider/pagecontrol.dart';
import 'package:team_7_sfacpolio/screen/followingprofile.dart';

class Follow_Bottom_Sheet extends StatefulWidget {
  final Map<String, dynamic> data;
  const Follow_Bottom_Sheet(this.data);

  @override
  State<Follow_Bottom_Sheet> createState() => _Follow_Bottom_SheetState();
}

class _Follow_Bottom_SheetState extends State<Follow_Bottom_Sheet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data['id']);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Page_Controller>(
      builder: (context, pageController, _) {
        return Container(
          width: 360,
          height: 203,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 360,
                height: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 32,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFFCCCCCC),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              widget.data['image'] != ''
                  ? Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(widget.data['image']),
                            fit: BoxFit.cover,
                          )),
                    )
                  : Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF0059FF)),
                    ),
              SizedBox(
                height: 8,
              ),
              Text(
                widget.data['email'],
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FollowingProfile(widget.data['id'])));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 41,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color(0xFFE6E6E6),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '프로필 보기',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 41,
                  child: Center(
                    child: Text(
                      '차단 하기',
                      style: TextStyle(
                        color: Color(0xFFFF0000),
                        fontSize: 15,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
