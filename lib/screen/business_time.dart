import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusinessTime extends StatefulWidget {
  const BusinessTime({super.key});

  @override
  State<BusinessTime> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BusinessTime> {
  Color _studentButtonColor = Colors.white;
  Color _prepareButtonColor = Colors.white;
  Color _workerButtonColor = Colors.white;
  Color _freeButtonColor = Colors.white;
  Color _newButtonColor = Colors.white;
  Color _threeButtonColor = Colors.white;

  Color _studentTextColor = Colors.black;
  Color _prepareTextColor = Colors.black;
  Color _workerTextColor = Colors.black;
  Color _freeTextColor = Colors.black;
  Color _newTextColor = Colors.black;
  Color _threeTextColor = Colors.black;

  void _onstudentButtonClicked() {
    setState(() {
      _studentButtonColor = Color(0xFF0059FF);
      _prepareButtonColor = Colors.white;
      _workerButtonColor = Colors.white;
      _freeButtonColor = Colors.white;
      _newButtonColor = Colors.white;
      _threeButtonColor = Colors.white;

      _studentTextColor = Colors.white;
      _prepareTextColor = Colors.black;
      _workerTextColor = Colors.black;
      _freeTextColor = Colors.black;
      _newTextColor = Colors.black;
      _threeTextColor = Colors.black;
    });
  }

  void _onprepareButtonClicked() {
    setState(() {
      _studentButtonColor = Colors.white;
      _prepareButtonColor = Color(0xFF0059FF);
      _workerButtonColor = Colors.white;
      _freeButtonColor = Colors.white;
      _newButtonColor = Colors.white;
      _threeButtonColor = Colors.white;

      _studentTextColor = Colors.black;
      _prepareTextColor = Colors.white;
      _workerTextColor = Colors.black;
      _freeTextColor = Colors.black;
      _newTextColor = Colors.black;
      _threeTextColor = Colors.black;
    });
  }

  void _onworkerButtonClicked() {
    setState(() {
      _studentButtonColor = Colors.white;
      _prepareButtonColor = Colors.white;
      _workerButtonColor = Color(0xFF0059FF);
      _freeButtonColor = Colors.white;
      _newButtonColor = Colors.white;
      _threeButtonColor = Colors.white;

      _studentTextColor = Colors.black;
      _prepareTextColor = Colors.black;
      _workerTextColor = Colors.white;
      _freeTextColor = Colors.black;
      _newTextColor = Colors.black;
      _threeTextColor = Colors.black;
    });
  }

  void _onfreeButtonClicked() {
    setState(() {
      _studentButtonColor = Colors.white;
      _prepareButtonColor = Colors.white;
      _workerButtonColor = Colors.white;
      _freeButtonColor = Color(0xFF0059FF);
      _newButtonColor = Colors.white;
      _threeButtonColor = Colors.white;

      _studentTextColor = Colors.black;
      _prepareTextColor = Colors.black;
      _workerTextColor = Colors.black;
      _freeTextColor = Colors.white;
      _newTextColor = Colors.black;
      _threeTextColor = Colors.black;
    });
  }

  void _onNewButtonClicked() {
    setState(() {
      _studentButtonColor = Colors.white;
      _prepareButtonColor = Colors.white;
      _workerButtonColor = Colors.white;
      _freeButtonColor = Colors.white;
      _newButtonColor = Color(0xFF0059FF);
      _threeButtonColor = Colors.white;

      _studentTextColor = Colors.black;
      _prepareTextColor = Colors.black;
      _workerTextColor = Colors.black;
      _freeTextColor = Colors.black;
      _newTextColor = Colors.white;
      _threeTextColor = Colors.black;
    });
  }

  void _ontreeButtonClicked() {
    setState(() {
      _studentButtonColor = Colors.white;
      _prepareButtonColor = Colors.white;
      _workerButtonColor = Colors.white;
      _freeButtonColor = Colors.white;
      _newButtonColor = Colors.white;
      _threeButtonColor = Color(0xFF0059FF);

      _studentTextColor = Colors.black;
      _prepareTextColor = Colors.black;
      _workerTextColor = Colors.black;
      _freeTextColor = Colors.black;
      _newTextColor = Colors.black;
      _threeTextColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
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
          Container(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'OOO님은 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: '어떤 사람',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                                text: '인가요?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    color: Color(0xFFF3F3F3), width: 1),
                              ),
                              width: 296,
                              height: 48,
                              child: OutlinedButton(
                                onPressed: _onstudentButtonClicked,
                                child: Text(
                                  '오전(9-12)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: _studentTextColor,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    backgroundColor: _studentButtonColor),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Color(0xFFF3F3F3), width: 1),
                              ),
                              width: 296,
                              height: 48,
                              child: OutlinedButton(
                                onPressed: _onprepareButtonClicked,
                                child: Text(
                                  '오후(2-5)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: _prepareTextColor,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    backgroundColor: _prepareButtonColor),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              width: 296,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    color: Color(0xFFF3F3F3), width: 1),
                              ),
                              child: OutlinedButton(
                                onPressed: _onworkerButtonClicked,
                                child: Text(
                                  '저녁(7-9)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: _workerTextColor,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    backgroundColor: _workerButtonColor),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Color(0xFFF3F3F3), width: 1),
                              ),
                              width: 296,
                              height: 48,
                              child: OutlinedButton(
                                onPressed: _onfreeButtonClicked,
                                child: Text(
                                  '밤(9-12)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: _freeTextColor,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    backgroundColor: _freeButtonColor),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Color(0xFFF3F3F3), width: 1),
                              ),
                              width: 296,
                              height: 48,
                              child: OutlinedButton(
                                onPressed: () {
                                  _onNewButtonClicked();
                                },
                                child: Text(
                                  '새벽(12-3)',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: _newTextColor),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    backgroundColor: _newButtonColor),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Color(0xFFF3F3F3), width: 1),
                              ),
                              width: 296,
                              height: 48,
                              child: OutlinedButton(
                                onPressed: () {
                                  _ontreeButtonClicked();
                                },
                                child: Text(
                                  '직접입력',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: _threeTextColor,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    backgroundColor: _threeButtonColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 140,
                            height: 50,
                            margin: EdgeInsets.all(8.0),
                            child: Container(
                              child: CupertinoButton(
                                padding: EdgeInsets.all(8.0),
                                color: Color(0xFFE5EEFF),
                                child: const Text(
                                  '건너뛰기',
                                  style: TextStyle(
                                      color: Color(0xFF0059FF),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          Container(
                            width: 140,
                            height: 50,
                            margin: EdgeInsets.all(8.0),
                            child: CupertinoButton(
                              padding: EdgeInsets.all(8.0),
                              color: Color(0xFF0059FF),
                              child: const Text(
                                '다음',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
