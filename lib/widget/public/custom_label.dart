import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/tools/export.dart';

class CustomLabel extends StatefulWidget {
  String title;
  Widget child;

  CustomLabel({
    Key key,
   @required this.title,
    @required this.child,
  }) : super(key: key);

  _CustomLabelState createState() => _CustomLabelState(title: this.title, child: this.child);
}

class _CustomLabelState extends State<CustomLabel> {
  String title;
  Widget child;

  _CustomLabelState({
    this.title,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.w,
      padding: EdgeInsets.only(left: 30.w,right: 30.w),
      color: ConfigColor.color_FFFFFF,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              this.title,
              style: TextStyle(color: ConfigColor.color_11121A, fontSize: 30.w),
            ),
          ),
          Container(
            child: this.child,
          )
        ],
      ),
    );
  }
}
