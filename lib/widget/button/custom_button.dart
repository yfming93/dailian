import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src/tools/export.dart';

// 主按钮: 蓝色渐变按钮样式
class CustomButton extends StatelessWidget {
  final String title;
  final bool isAllowClick;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final BoxDecoration decoration;
  final Color bgColor;
  final Color textColor;

  CustomButton(
      {@required this.title,
      this.isAllowClick = true,
      this.onPressed,
      this.fontSize,
      this.fontWeight,
      this.decoration,
      this.height = 45,
      this.width = 750,
      this.bgColor = const Color(0xFF025DFB),
      this.textColor = const Color(0xFFFFFFFF),
      this.borderRadius = 6});

  @override
  Widget build(BuildContext context) {
    print('-----isAllowClick：${isAllowClick}');

    return InkWell(
      onTap:
          isAllowClick != true ?  null : onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: decoration ?? BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: (isAllowClick != true)
              ? ConfigColor.color_E6E6E6
              : bgColor,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isAllowClick == true
                ? textColor
                : ConfigColor.color_CDCDCD,
            fontSize: this.fontSize ?? 36.sp,
            fontWeight: fontWeight ?? Medium,
          ),
        ),
      ),
    );
  }
}
