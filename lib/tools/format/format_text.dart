
 import 'package:common_utils/common_utils.dart';

String formatEmptyStr(dynamic str) {
  if(ObjectUtil.isEmpty(str)){
    str='';
  }
  return str;
}

 String formatEmptyAmount(dynamic str) {
   if(ObjectUtil.isEmpty(str)){
     str='0.0';
   }
   return str;
 }
