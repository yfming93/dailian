import 'dart:math';

class MathUtils{

  /// 获取16位随机数
  static String generateRandom16(){
    String alphabet = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
    int strLength = 16; /// 生成的字符串固定长度
    String randomStr = '';
    for (var i = 0; i < strLength; i++) {
      randomStr = randomStr + alphabet[Random().nextInt(alphabet.length)];
    }
    print('randomStr16 = ${randomStr}');
    return randomStr;
  }

  /// 随机取激活码,也可以当作唯一数,这只是一种算法而已
  /// length 随机字符串长度
  static String getRandomString(int length) {
    String str = "abcdefghigklmnopkrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZ0123456789";
    String randomStr;
    Random random = Random();
    StringBuffer sb = StringBuffer();
    for (int i = 0; i < length; i++) {
      int number = random.nextInt(str.length);// 0~61
      sb.write(str[number]);
    }
    randomStr = sb.toString();
    print('randomStr = ${randomStr}');
    return randomStr;
  }

  static String getRandom([start = 50, end = 51]){
    Random random = Random();
    int number = start + random.nextInt(end);
    return '$number';
  }

}