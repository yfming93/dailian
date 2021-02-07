/*
   * thf
   * target  要转换的数字
   * postion 要保留的位数
   * isCrop  true 直接裁剪 false 四舍五入
   */
import 'package:common_utils/common_utils.dart';

String FormatNum(num target, int postion, {bool isCrop = true, bool isFillIn = true}) {
  String t = target.toString();
  // 如果要保留的长度小于等于0 直接返回当前字符串
  if (postion < 0) {
    return t;
  }
  if (t.contains(".")) {
    String t1 = t.split(".").last;
    if (t1.length >= postion) {
      if (isCrop) {
        // 直接裁剪
        return t.substring(0, t.length - (t1.length - postion));
      } else {
        // 四舍五入
        return target.toStringAsFixed(postion);
      }
    } else {
      if (isFillIn) {
        // 不够位数的补相应个数的0
        String t2 = "";
        for (int i = 0; i < postion - t1.length; i++) {
          t2 += "0";
        }
        return t + t2;
      } else {
        return t;
      }
    }
  } else {
    // 不含小数的部分补点和相应的0
    String t3 = postion > 0 ? "." : "";

    for (int i = 0; i < postion; i++) {
      t3 += "0";
    }
    return t + t3;
  }
}


String quantityProcess(double quantity) {
  String quantityStr = quantity.toString();
  List<String> quantityList = quantityStr.toString().split('.');

  if (quantityList[1].length > 8) {
    quantityStr =
        quantityStr.split('.')[0] +'.'+ quantityStr.split('.')[1].substring(0, 8);
  } else {
    if (quantity == quantity.floor()) {
      quantityStr = quantity.floor().toString();
    } else {
      quantityStr = quantity.toString();
    }
  }
  return quantityStr;
}

double formatDouble(double num ,{int fractionDigits=8}){
  return double.parse(FormatNum(num,fractionDigits,isCrop:true));
}

