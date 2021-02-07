

//static Color MAIN_TXT_COLOR = Colors.black;


import '../tools/export.dart';

class AppStyle {
  /// 白色背景 四周阴影边框 样式
  static BoxDecoration boxDecoration  = BoxDecoration(
    borderRadius: BorderRadius.circular(6.0),
    color: Color(0xFF0F1217),
    boxShadow: [
      BoxShadow(
          color: Colors.black12,
          offset: Offset(0.0, 5.0), //阴影xy轴偏移量
          blurRadius: 15.0, //阴影模糊程度
          spreadRadius: 1.0 //阴影扩散程度
      )
    ],
  );

  /// 主要渐变色
  static BoxDecoration boxDecorationGradient  = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors:
        [
        ]
    ),
  );

//  /// 主要16px Semibold 黑色字体样式
//  static  TextStyle mainTextStyle = TextStyle(
//      color: AppColors.MAIN_TXT_COLOR,fontWeight: Semibold,fontSize: 16
//  );

//  /// 体样式 颜色默认 黑色 大小默认16px  fontWeight 默认Semibold
//  static TextStyle mainTextSet ({double fontSize, Color textColor,FontWeight fontWeight}) {
//    return TextStyle(
//        color:textColor ?? AppColors.MAIN_TXT_COLOR,
//        fontWeight: fontWeight ?? Semibold,
//        fontSize: fontSize ?? 16.0
//    );
//  }

}

