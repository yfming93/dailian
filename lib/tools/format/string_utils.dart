
import 'package:common_utils/common_utils.dart';

///
/// 取值
///
String STR(var value){
  return '${value}';
}

class StringUtils{

  ///
  /// 时间格式
  ///
  static String getTimeFormat({DateTime dateTime, String format}) {
    return DateUtil.formatDate(dateTime ?? DateTime.now(), format: format ?? 'yyyyMMdd');
    // return DateUtil.formatDateStr(dateTime ?? DateTime.now(), format: format ?? 'yyyyMMdd');
  }

  ///
  /// 数字简写，目前行情在使用
  ///
  static String digitalForShort(String num) {
    if(null == num)
      return '';
    try{
      String ret;
      double digital = double.parse(num);
      double wan = digital / 10000;
      if(wan >= 1){
        double yi = wan / 10000;
        if(yi >= 1){
          ret = yi.toStringAsFixed(2) + '亿';
        }else{
          ret = wan.toStringAsFixed(2) + '万';
        }
      }else{
        ret = digital.toStringAsFixed(0);
      }
      return ret;
    }catch(e){

    }
    return '';
  }

  ///
  /// 20120227T132700
  /// 把API返回的时间转换成时间戳，目前K线需要
  ///
  static String transTimeStamp(String timeStr){
    if(ObjectUtil.isEmpty(timeStr))
      return null;
    DateTime dateTime = DateTime.now();
    if(8 == timeStr.length) {
      timeStr = timeStr + 'T0000';
      dateTime = DateTime.parse(timeStr);
    }
    else if(12 == timeStr.length) {
      timeStr = timeStr.substring(0, 8) + 'T' + timeStr.substring(8);
      dateTime = DateTime.parse(timeStr);
    }
    return '${(dateTime.millisecondsSinceEpoch / 1000).floor()}';
  }

  ///
  /// 2020-10-30T08:49:44.000Z
  /// 把固定格式的时间字符串转换成对象
  ///
  static DateTime parseDateTime(String timeStr){
    if(ObjectUtil.isEmpty(timeStr))
      return null;
    try{
      DateTime dateTime = DateTime.parse(timeStr);
      return dateTime;
    }catch(e){

    }
    return null;
  }

  /// 格式化时间
  static String parseFormatTime(String timeStamp){
    //
    DateTime dateTime = StringUtils.parseDateTime(timeStamp);
    // 转成UTC时间
    dateTime = DateTime.utc(dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute, dateTime.second, dateTime.millisecond, dateTime.microsecond);
    // dateTime = dateTime.toUtc();
    // 转成本地时间
    dateTime = dateTime.toLocal();
    if(null != dateTime) {
      return StringUtils.getTimeFormat(dateTime: dateTime, format: "yyyy-MM-dd\nHH:mm:ss");
    }
    return timeStamp;
  }

}