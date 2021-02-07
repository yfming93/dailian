import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOtcButton extends StatefulWidget {
  String title;
  double fontSize;
  double width;
  double height;
  FontWeight fontweight;
  Color titleColor; //   字体颜色
  Color backgroundColor; //  背景颜色
  Color borderColor; //   边框颜色
  Function onTap; // 点击
  double borderRadius; // 圆角
  double borderWidth; // 线宽


  CustomOtcButton(
      {Key key,
        this.width,
        this.height,
        this.title,
        this.fontSize,
        this.titleColor,
        this.backgroundColor,
        this.borderColor = Colors.transparent,
        this.onTap,
        this.fontweight,
        this.borderRadius = 0,
        this.borderWidth = 0})
      : super(key: key);

  _CustomOtcButtonState createState() => _CustomOtcButtonState();
}

class _CustomOtcButtonState extends State<CustomOtcButton> {

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      radius: 0.0,
      highlightColor: Colors.transparent,
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
            border: Border.all(width: ScreenUtil().setWidth(widget.borderWidth),color: widget.borderColor)),
        child: Text(
          widget.title,
          style: TextStyle(
              color: widget.titleColor,
              fontSize: widget.fontSize,
              fontWeight: widget.fontweight),
        ),
      ),
    );
  }
}
