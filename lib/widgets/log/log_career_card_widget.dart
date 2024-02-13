import 'package:flutter/material.dart';

class LogCareerCardWidget extends StatefulWidget {
  final String careerdate;
  final String careerproject;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  LogCareerCardWidget({
    Key? key,
    required this.careerdate,
    required this.careerproject,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  _LogCareerCardWidgetState createState() => _LogCareerCardWidgetState();
}

class _LogCareerCardWidgetState extends State<LogCareerCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 6),
      padding: EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 182,
                height: 34,
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.careerproject,
                  maxLines: 2,
                  style: TextStyle(
                    color: Color(0xFF4C4C4C),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: widget.onEdit,
                    child: Icon(
                      Icons.edit,
                      color: Color(0xFF999999),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: widget.onDelete,
                    child: Icon(
                      Icons.delete,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          SizedBox(
            width: 151,
            child: Text(
              widget.careerdate,
              maxLines: 1,
              style: TextStyle(
                color: Color(0xFF7F7F7F),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
