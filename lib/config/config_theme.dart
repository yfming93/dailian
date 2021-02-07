import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/tools/export.dart';
import 'config_screen.dart';

class AppThemes {

  /// 主题
  static ThemeData mainTheme() {
    Color cl = Color(0xFFF7F7F7);
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: cl,
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // AppBar背景
      appBarTheme: AppBarTheme(
        // 统一设置AppBar底部阴影
        elevation: 0,
        // 统一设置AppBar背景色，如果状态栏无色，则状态栏同此色
        color: cl,
        // 统一设置AppBar字体颜色
        brightness: Brightness.dark,

        // 图标风格
        iconTheme: IconThemeData(color: ConfigColor.color_11121A),
        // 文字风格
        textTheme: TextTheme(
          // 标题风格
          headline6: TextStyle(
            //fontSize: 18.sp,
            fontWeight: Medium,
            color: ConfigColor.color_11121A,
          ),
        ),
        // 右侧action图标风格
        actionsIconTheme: IconThemeData(color: ConfigColor.color_11121A)

      ),

      // 统一设置脚手架背景
      scaffoldBackgroundColor: cl,

      // 正文文字颜色
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontFamily: 'DIN Alternate Bold',
        ),
        bodyText2: TextStyle(
          fontFamily: 'DIN Alternate Bold',
        ),
        subtitle1: TextStyle(
          fontFamily: 'DIN Alternate Bold',
        ),
        subtitle2: TextStyle(
          fontFamily: 'DIN Alternate Bold',
        ),
        headline5: TextStyle(
          decoration: TextDecoration.none
        ),
        headline6: TextStyle(
          decoration: TextDecoration.none
        ),
      ),

    );
  }

  /// 标题风格
  static TextStyle titleStyle(){
    return TextStyle(
      fontSize: AppScreen.setSp(18.sp),
      fontWeight: Bold,
    );
  }



}