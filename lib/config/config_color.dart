import 'dart:math';

import 'package:flutter/material.dart';


class ConfigColor {


  static Color color_A5A5A5 = Color(0xFFA5A5A5);
  static Color color_FFFFFF = Color(0xFFFFFFFF);
  static Color color_999999 = Color(0xFF999999);

  // 主背景色
  static Color color_F7F7F7 = Color(0xFFF7F7F7);
  static Color color_main = Color(0xFFff8038);

  //分割线颜色
  static Color color_E6E6E6 = Color(0xFFE6E6E6);
  // 次要文字
  static Color color_CDCDCD = Color(0xFFCDCDCD);
  static Color color_DAA888 = Color(0xFF0AA888);
  static const Color color_025DFB = Color(0xFF025DFB);
  static Color color_11121A = Color(0xFF11121A);
  static Color color_ECF1F8 = Color(0xFFECF1F8);
  static Color color_FDA513 = Color(0xFFFDA513);
  static Color color_E8F3FF = Color(0xFFE8F3FF);
  static Color color_0AA88B = Color(0xFF0AA88B);
  static Color color_99FFFFFF = Color(0x99FFFFFF);
  static Color color_33FFFFFF = Color(0x33FFFFFF);
  static Color color_transparent= Colors.transparent;












  static Color aHex(int x ){
    String str = x.toString();
    if (str.matchAsPrefix("#") != null)  str = str.substring(1);
    return  Color(int.parse('0x'+str));
  }

  /// 根据 十六进制字符串设置颜色 #FFD87D #FFFFD87D
  static Color hex(String hex) {
    String hexString = hex;
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('FF');
    }
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color randomColor() {
    return Color.fromARGB(255, Random.secure().nextInt(255),
        Random.secure().nextInt(255), Random.secure().nextInt(255));
  }

}
