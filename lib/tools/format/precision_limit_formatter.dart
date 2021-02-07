import 'package:flutter/services.dart';

///价格输入框和数量输入框的限制
class PrecisionLimitFormatter extends TextInputFormatter {
  int scale;

  PrecisionLimitFormatter({
    this.scale = 8
  });

  RegExp exp = new RegExp(r"^[1-9]+(\.\d{0,2})?");

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    // 输入完全删除
    if (newValue.text.isEmpty) {
      return TextEditingValue();
    }

    // 匹配0
    if ('0' == newValue.text) {
      return newValue;
    }

    // 匹配非0开头的小数
    if (exp.hasMatch(newValue.text)) {
      if(checkScale(newValue)){
        return newValue;
      }
    }

    // 匹配0开头的小数
    if (newValue.text.startsWith("0.") && newValue.text.indexOf(".") == newValue.text.lastIndexOf(".")) {
      if(checkScale(newValue)){
        return newValue;
      }
    }
    return oldValue;
  }

  bool checkScale(TextEditingValue newValue){
    int pointIndex = newValue.text.indexOf(".");
    int newLength = newValue.text.length;
    if(newLength - pointIndex - 1 <= scale){
      return true;
    }
    return false;
  }
}
