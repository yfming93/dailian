import 'dart:convert';

class JsonUtils{
  ///---------------------------------序列化-----------------------------------///
  /// 把对象转成Json String
  static String encode(Object value){
    return json.encode(value);
  }

  /// 把对象转成Json String
  static String encode2(Object value){
    return jsonEncode(value);
  }


  ///---------------------------------反序列化---------------------------------///
  /// flutter只提供了json to Map
  /// 把Json String转成Json对象
  /// 一般是转成Map
  static decode(String source){
    return json.decode(source);
  }

  /// flutter只提供了json to Map
  /// 把Json String转成Json对象
  /// 一般是转成Map
  static decode2(String source){
    return jsonDecode(source);
  }
}