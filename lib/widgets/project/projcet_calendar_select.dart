import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Project_Calendar_Select extends StatefulWidget {
  const Project_Calendar_Select({super.key});

  @override
  State<Project_Calendar_Select> createState() =>
      _Project_Calendar_SelectState();
}

class _Project_Calendar_SelectState extends State<Project_Calendar_Select> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: 360,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Column(
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
              height: 24,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                '예상 진행 기간을 선택하세요.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF020202),
                  fontSize: 18,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              height: 410,
              child: TableCalendar(
                onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                  // 선택된 날짜의 상태를 갱신합니다.
                  setState(() {
                    this.selectedDay = selectedDay;
                    this.focusedDay = focusedDay;
                  });
                },
                selectedDayPredicate: (DateTime day) {
                  // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
                  return isSameDay(selectedDay, day);
                },
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                  titleTextStyle: TextStyle(
                    color: Color(0xFF020202),
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                focusedDay: DateTime.now(),
                firstDay: DateTime.now(),
                lastDay: DateTime(2034, 12, 31),
                locale: 'ko-KR',
                daysOfWeekHeight: 30,
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Color(0xFF0059FF), // 선택된 날짜의 배경색상을 여기서 지정하세요.
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  weekendTextStyle: TextStyle(color: Colors.grey),
                  outsideDaysVisible: false,
                  todayDecoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 0),
                  ),
                  todayTextStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                calendarBuilders: CalendarBuilders(
                  dowBuilder: (context, day) {
                    switch (day.weekday) {
                      case 1:
                        return Center(
                          child: Text('월'),
                        );
                      case 2:
                        return Center(
                          child: Text('화'),
                        );
                      case 3:
                        return Center(
                          child: Text('수'),
                        );
                      case 4:
                        return Center(
                          child: Text('목'),
                        );
                      case 5:
                        return Center(
                          child: Text('금'),
                        );
                      case 6:
                        return Center(
                          child: Text('토'),
                        );
                      case 7:
                        return Center(
                          child: Text(
                            '일',
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      default:
                        return null;
                    }
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, selectedDay);
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFF0059FF)),
                child: Center(
                  child: Text(
                    '선택하기',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
