import 'package:common_utils/common_utils.dart';
import 'package:flutter/services.dart';

class RegexUtils{

  /// 过滤掉输入助记词的空白字符，替换为空格
  static String getCorrectMnemonic(String mnemonicWords) {
    RegExp exp = new RegExp(r"(\w+)");
    Iterable<Match> matches = exp.allMatches(mnemonicWords);
    String _mnemonicWords = "";
    for (Match m in matches) {
      String match = m.group(0);
      print(match);
      _mnemonicWords = _mnemonicWords + match + " ";
    }
    _mnemonicWords = _mnemonicWords.trimRight();
    return _mnemonicWords;
  }

  /// 按规则省略字符串
  static String omitString(String wallAddress) {
    RegExp exp = new RegExp(r"(\w{15})\w+(\w{5})");
    if (exp.hasMatch(wallAddress)) {
      RegExpMatch match = exp.firstMatch(wallAddress);
      return match.group(1) + "..." + match.group(2);
    }
    return wallAddress;
  }

  /// 按规则省略字符串
  static String compressString(String mnemonicWords) {
    RegExp exp = new RegExp(r"(\w{15})\w+(\w{5})");
    Iterable<Match> matches = exp.allMatches(mnemonicWords);
    String ret = "";
    for (Match m in matches) {
      String aa = m.group(0);
      print("AA = " + aa);
      String bb = m.group(1);
      print("BB = " + bb);
      String cc = m.group(2);
      print("CC = " + cc);
      ret = bb + "..." + cc;
    }
    return ret;
  }

  /// 手机号省略
  static String phoneOmit(String phoneStr) {
    if (ObjectUtil.isEmpty(phoneStr)) {
      return "";
    }
    else {
      if(phoneStr.contains("-")){
        phoneStr = (phoneStr.split('-'))[1];
      }
      if (phoneStr.length < 7) {
        return phoneStr;
      } else {
        phoneStr=phoneStr.substring(0, 3) + "****" + phoneStr.substring(7, phoneStr.length);
      }
    }
    return phoneStr;
  }

  /// 验证是否是身份证
  static bool isIdCard(String str) {
    RegExp exp =  RegExp(r"(^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx])");
    return exp.hasMatch(str);
  }

  static bool isExistNumber(String str) {
    return RegExp('[0-9]').hasMatch(str);
  }

  static bool isExistWord(String str) {
    return RegExp('[a-zA-Z]').hasMatch(str);
  }

  static bool isExistNumberAndWord(String str) {
    return isExistNumber(str) && isExistWord(str);
  }

  /// 浮点，仅允许输入白名单中字符
  static List<TextInputFormatter> float() {
    return [
      // ignore: deprecated_member_use
      WhitelistingTextInputFormatter(RegExp("[0-9.]")),
    ];
  }

  /// 数字
  static List<TextInputFormatter> number() {
    return [
      // ignore: deprecated_member_use
      WhitelistingTextInputFormatter(RegExp("[0-9]")),
      // WhitelistingTextInputFormatter.digitsOnly
    ];
  }

  /// 数字形制长度
  static List<TextInputFormatter> numberAndLength(int len) {
    return [
      // ignore: deprecated_member_use
      WhitelistingTextInputFormatter(RegExp("[0-9]")),
      LengthLimitingTextInputFormatter(len)
    ];
  }

  /// 数字字母形制
  static List<TextInputFormatter> numberAndLetter() {
    return [
      // ignore: deprecated_member_use
      WhitelistingTextInputFormatter(RegExp("[0-9a-zA-Z]"))
    ];
  }

  /// 数字字母形制长度
  static List<TextInputFormatter> numberLetterAndLength(int len) {
    return [
      // ignore: deprecated_member_use
      WhitelistingTextInputFormatter(RegExp("[0-9a-zA-Z]")),
      LengthLimitingTextInputFormatter(len),
    ];
  }

  /// 忽略特殊字符 + 长度
  static List<TextInputFormatter> ignoreSpecialAndLength(int len) {
    return [
      // ignore: deprecated_member_use
      WhitelistingTextInputFormatter(RegExp("[\u4E00-\u9FA5A-Za-z0-9]")),
      LengthLimitingTextInputFormatter(len)
    ];
  }

  ///------------------------------------------------------------------------///
  static List<TextInputFormatter> getSingleLineFormatter(){
    return[
      // 黑名单
      BlacklistingTextInputFormatter.singleLineFormatter,
    ];
  }

  /// 限制小数输入，带r
  static List<TextInputFormatter> getRegExpFloat() {
    return [
      FilteringTextInputFormatter.allow(RegExp(r"(^[1-9]\d*|^[0])(\.\d*)?")),
    ];
  }

  /// 限制小数输入，带r
  static List<TextInputFormatter> getRegExpFloatLen(int len) {
    return [
      // PrecisionLimitFormatter(scale: 2),
      LengthLimitingTextInputFormatter(len),
      FilteringTextInputFormatter.allow(RegExp(r"(^[1-9]\d*|^[0])(\.\d{0,2})?")),
    ];
  }

  /// 限制整数数输入，带r
  static List<TextInputFormatter> getRegExpInt() {
    return [
      FilteringTextInputFormatter.allow(RegExp(r"(^[1-9]\d*|^[0])")),
    ];
  }

  /// 限制整数数输入，带r
  static List<TextInputFormatter> getRegExpIntLen(int len) {
    return [
      FilteringTextInputFormatter.allow(RegExp(r"(^[1-9]\d*|^[0])")),
      LengthLimitingTextInputFormatter(len),
    ];
  }

  /// 取ip
  static String getIp(String url) {
    RegExp exp = RegExp(r"\D+(\d+\.\d+\.\d+\.\d+)\D\S+");
    Iterable<Match> matches = exp.allMatches(url);
    String ret = "";
    for (Match m in matches) {
      String aa = m.group(0);
      String bb = m.group(1);
      ret = bb;
    }
    return ret;
  }

  /// 取视频Url
  static String getVideoUrl(String url) {
    RegExp exp = RegExp(r"(\S+)\?\S+");
    Iterable<Match> matches = exp.allMatches(url);
    String ret = "";
    for (Match m in matches) {
      String aa = m.group(0);
      String bb = m.group(1);
      ret = bb;
    }
    return ret;
  }

  /// 取视频路径
  static String getVideoPath(String url) {
    RegExp exp = RegExp(r"\S+=(\S+)");
    Iterable<Match> matches = exp.allMatches(url);
    String ret = "";
    for (Match m in matches) {
      String aa = m.group(0);
      String bb = m.group(1);
      ret = bb;
    }
    return ret;
  }

  ///
  /// 输入全是数字或字母
  ///
  static bool matchNumOrLetters(String input) {
    // 全数字匹配
    RegExp numRegExp = RegExp(r"\d+");
    String match = numRegExp.stringMatch(input);
    // 完全匹配
    if(input == match){
      return true;
    }
    // 全字母匹配
    RegExp letterRegExp = RegExp(r"[A-Za-z]+");
    match = letterRegExp.stringMatch(input);
    // 完全匹配
    if(input == match){
      return true;
    }
    return false;
  }

  ///验证中文
  static bool isChinese(String value) {
    return RegExp(
        r"[\u4e00-\u9fa5]")
        .hasMatch(value);
  }

}

