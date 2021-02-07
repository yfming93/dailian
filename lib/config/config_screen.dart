import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui show window;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScreen {
  /// 750 dp/px  设计稿宽
  static final int DESIGN_W = 375;
  /// 1443 dp/px 设计稿高
  static final int DESIGN_H = 812;

  /// 风格
  static void updateStatusBarStyle(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  /// 屏幕宽
  static double get width {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.width;
  }

  /// 屏幕高
  static double get height {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.height;
  }

  /// 屏幕宽
  static double get width2 {
    return ScreenUtil.screenWidth;
  }

  /// 屏幕高
  static double get height2 {
    return ScreenUtil.screenHeight;
  }

  /// 屏幕宽
  static double get widthPx {
    return ScreenUtil.screenWidthPx;
  }

  /// 屏幕高
  static double get heightPx {
    return ScreenUtil.screenHeightPx;
  }

  ///---------------------------------------------------------------------------
  /// 屏幕密度，每个逻辑像素中包含多少个物理像素
  static double get density {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.devicePixelRatio;
  }

  /// 屏幕密度，每个逻辑像素中包含多少个物理像素
  static double get density2 {
    return ScreenUtil.pixelRatio;
  }

  /// 字体缩放值，The number of font pixels for each logical pixel.
  /// 每个逻辑像素中包含多少个字体像素
  static double get textScaleFactor {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.textScaleFactor;
  }


  ///---------------------------------------------------------------------------

  /// 顶部安全区域高度
  static double get topSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top;
  }

  /// 底部安全区域高度
  static double get bottomSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.bottom;
  }


  /// 顶部安全区域高度
  static double topSafeHeight2(BuildContext context) =>
      MediaQuery.of(context).viewPadding.top;

  /// 底部安全区域高度
  static double bottomSafeHeight2(BuildContext context) =>
      MediaQuery.of(context).viewPadding.bottom;



  /// 顶部主导航栏高度
  static double get navigationTopBarHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top + kToolbarHeight;
  }

  /// 底部主导航栏高度
  // static double navigationBottomBarHeight = 49;

  /// 底部主导航栏高度
  static double get navigationBottomBarHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.bottom + kToolbarHeight;
  }



  ///---------------------------------------------------------------------------
  /// 实际的dp与UI设计px的比例
  static double get scaleWidthRatio {
    return ScreenUtil().scaleWidth;
  }

  /// 实际的dp与UI设计px的比例
  static double get scaleHeightRatio {
    return ScreenUtil().scaleHeight;
  }

  /// 按照宽等比缩放
  static double setWidth(double width) {
    return ScreenUtil().setWidth(width);
  }

  /// 按照高等比缩放
  static double setHeight(double height) {
    return ScreenUtil().setHeight(height);
  }

  /// 字体大小适配，[fontSize] UI设计上字体的大小,单位px.
  /// 不缩放【先适配，再除以textScaleFactor】
  static double setSp(double size) {
    return ScreenUtil().setSp(size, allowFontScalingSelf: false);
  }

  /// 字体大小适配，[fontSize] UI设计上字体的大小,单位px.
  /// 缩放【直接适配】
  static double setSp2(double size) {
    return ScreenUtil().setSp(size, allowFontScalingSelf: true);
  }

  /// 适配缩放比例
  static double get scaleText {
    return ScreenUtil().scaleText;
  }

  /// 屏幕密度缩放比例
  static double get scaleFactor {
    return ScreenUtil.textScaleFactor;
  }

  /// 全屏
  static void fullScreen(){
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  /// 恢复
  static void resumeScreen(){
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

}
