
/// List 扩展方法
extension ListAdd on List {

  // 用某个字符串 string 拼接 list 中每个字符串元素
  String joinWith(String string ){
    String end = "";
    for (int i = 1; i <= this.length; i++){
      if (this[i - 1] is String){
        end = end + this[i - 1];
        if (i < this.length){
          end = end + string;
        }
      }
    }
    return end;
  }
}