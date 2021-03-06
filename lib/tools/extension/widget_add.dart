import 'package:flutter/material.dart';

extension WidgetAdd on Widget {

  /// 用点语法糖 给一个 Widget 添加一些属性
  Container intoContainer({
    //复制Container构造函数的所有参数（除了child字段）
    Key key,
    AlignmentGeometry alignment,
    EdgeInsetsGeometry padding,
    Color color,
    Decoration decoration,
    Decoration foregroundDecoration,
    double width,
    double height,
    BoxConstraints constraints,
    EdgeInsetsGeometry margin,
    Matrix4 transform,
  }) {
    //调用Container的构造函数，并将当前widget对象作为child参数
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      child: this,
    );
  }

  /// 添加一个相邻的widget，返回List<Widget>
  List<Widget> addNeighbor(Widget widget) {
    return <Widget>[this, widget];
  }
}

extension WidgetExt on Widget {
  //添加一个相邻的widget，返回List<Widget>
  List<Widget> addNeighbor(Widget widget) {
    return <Widget>[this, widget];
  }

//添加各种单child的widget容器
//如:Container、Padding等...
}

extension WidgetListExt<T extends Widget> on List<T> {
  //子List<Widget>列表中再添加一个相邻的widget，并返回当前列表
  List<Widget> addNeighbor(Widget widget) {
    return this..add(widget);
  }

  Row intoRow({
    Key key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline textBaseline,
  }) {
    return Row(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: this,
    );
  }
//添加其它多child的widget容器
//如:Column、ListView等...
}

