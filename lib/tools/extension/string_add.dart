

import 'package:common_utils/common_utils.dart';
import 'package:flutter/services.dart';

/// 字符串扩展方法
extension StringAdd on String{
  int get toInt {
    if(this == null) return 0;
    return int.parse(this);
  }

  double get toDouble {
    if(this == null) return 0.0;
    return double.parse(this);
  }

  String get safe {
    return this ?? "";
  }

  // 字符串数字大于0
  bool get isGreaterZero {
    if(this?.isEmpty == true) return false;
    if (this.toDouble > 0){
      return true;
    }
    return false;
  }

  // 取整 小数点后面舍弃
  String get int0 {
    if(this == null) return "0";
    return formatNum(this.toDouble, 0);
  }

  // 保留1位小数
  String get double01 {
    if(this == null) return "0.0";
    return formatNum(this.toDouble, 1);
  }

  // 保留2位小数
  String get double02 {
    if(this == null) return "0.00";
    return formatNum(this.toDouble, 2);
  }

  // 保留4位小数
  String get double04 {
    if(this == null) return "0.0000";
    return formatNum(this.toDouble, 4);
  }

  // 保留8位小数
  String get double08 {
    if(this == null) return "0.00000000";
    return formatNum(this.toDouble, 8);
  }

  // 保留几位小数
  String doubleNum(int position ){
    return formatNum(this.toDouble, position);
  }

  // 空字符串判断
  String get nullFit {
    if(this == null) return "";
    return this;
  }


  String get copyToClipboard {
    Clipboard.setData(ClipboardData(text: this??""));
    return this;
  }

  // 时间格式 MM-dd HH:mm
  String get time {
    if (this.contains(":") && this.contains("-") ){
      String str = DateUtil.formatDateStr(this,
          isUtc: false, format: 'MM-dd HH:mm');
      return str;
    }
    return this;
  }

  // 时间格式 传参
  String timeFormat (String format) {
    if (this.contains(":") && this.contains("-") ){
      String str = DateUtil.formatDateStr(this,
          isUtc: false, format: format??'MM-dd HH:mm');
      return str;
    }
    return this;
  }

  /// 手机号加星星省略
  String get phoneToStarNumber  {
    String phoneStr = this;
    if (ObjectUtil.isEmpty(phoneStr)) {
      return phoneStr;
    } else {
      if (phoneStr.contains("-")) {
        phoneStr = (phoneStr.split('-'))[1];
      }
      if (phoneStr.length < 7) {
        return phoneStr;
      } else {
        phoneStr = phoneStr.substring(0, 3) +
            "****" +
            phoneStr.substring(7, phoneStr.length);
      }
    }
    return phoneStr;
  }

  /// 身份证加星星省略
  String get idCardToStarNumber  {
    String str = this;
    if (ObjectUtil.isEmpty(str)) {
      return str;
    } else {
      if (str.length < 12) {
        return str;
      } else {
        str = str.substring(0, 6) +
            "******" +
            str.substring(12, str.length);
      }
    }
    return str;
  }

  /// 名字加星星省略
  String get nameToStarName  {
    String name = this;
    if (ObjectUtil.isEmpty(name)) {
      return name;
    } else {
      if (name.length > 4) {
        return name;
      } else {
        name = name.substring(0, 1) +
            "*" +
            name.substring(2, name.length);
      }
    }
    return name;
  }

/*
* num target
* position 位置
* isCrop 截取 = true 或 四舍五入 =false
* isFillIn 补全0
* */
  String formatNum(num target, int position ,{bool isCrop = true, bool isFillIn = true}) {
    String t = target.toString();
    // 如果要保留的长度小于等于0 直接返回当前字符串
    if (position < 0) {
      return t;
    }
    if (t.contains(".")) {
      String t1 = t.split(".").last;
      if (t1.length >= position) {
        if (position == 0) {
          return  t.split(".").first; // 取整
        }
        if (isCrop) {
          // 直接裁剪
          return t.substring(0, t.length - (t1.length - position));
        } else {
          // 四舍五入
          return target.toStringAsFixed(position);
        }
      } else {
        if (isFillIn) {
          // 不够位数的补相应个数的0
          String t2 = "";
          for (int i = 0; i < position - t1.length; i++) {
            t2 += "0";
          }
          return t + t2;
        } else {
          return t;
        }
      }
    } else {
      // 不含小数的部分补点和相应的0
      String t3 = position > 0 ? "." : "";
      for (int i = 0; i < position; i++) {
        t3 += "0";
      }
      return t + t3;
    }
  }
}