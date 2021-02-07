import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src/config/config_color.dart';
import 'package:src/config/font_weight_config.dart';
import 'package:src/tools/export.dart';
import 'package:src/tools/export.dart';

/// 切换TAB回调方法原型
typedef OnChangeTabCallback = void Function(int index);

class SegmentBtn extends StatefulWidget {
  // 标题
  List<String> titles;
  // 控件的高度
  final double height;
  // 切换TAB的回调接口
  OnChangeTabCallback onChangeTab;
  // true：平分空间
  // false：全部居中
  bool expanded;
  // 选中文字颜色
  final Color textColor;
  // 选中项
  int selectIndex;
  // 字体大小
  double fontSize;
  // 选中字体大小
  double fontSelectedSize;
  // 内间距
  final EdgeInsetsGeometry padding;

  SegmentBtn({
    @required this.titles,
    this.height,
    this.onChangeTab,
    this.expanded = true,
    this.textColor = Colors.white,
    this.selectIndex = 0,
    this.fontSize,
    this.fontSelectedSize,
    this.padding
  });

  @override
  _SegmentBtnState createState() => _SegmentBtnState();
}

class _SegmentBtnState extends State<SegmentBtn> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30.w, 0, 30.w, 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(10.w),topLeft: Radius.circular(10.w)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFFF833E), Color(0xFFFF630D)],
        ),
      ),
      child: Row(
        // 左右居中，从中间开始布局
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _buildItems(),
      ),
    );
  }

  /// 所有选项
  List<Widget> _buildItems() {
    List<Widget> items = [];
    for (int i = 0; i < widget.titles.length; i++) {
      Widget child = buildButtonItem(i, onTap: () {
        widget.onChangeTab(i);
      });
      Widget item = Container(
        child: child,
      );
      item = widget.expanded ? Expanded(child: item) : item;
      items.add(item);
    }
    return items;
  }

  /// 选项细节
  Widget buildButtonItem(int index, {GestureTapCallback onTap}) {

    return InkWell(
      child: Container(
          height: widget.height,
          padding: widget.padding ?? EdgeInsets.symmetric(vertical: 5),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  height: 3,
              ),
              GradientText(
                  widget.titles[index],
                  textAlign: TextAlign.left,
                  gradient: LinearGradient(colors:[widget.textColor, widget.textColor]),
                  style: TextStyle(
                      fontSize: widget.selectIndex == index ? widget.fontSelectedSize : widget.fontSize,
                      fontWeight: widget.selectIndex == index ? Medium : Regular
                  )
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 20,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: widget.selectIndex == index
                              ?
                          ([widget.textColor, widget.textColor])
                              :
                          [Colors.transparent, Colors.transparent],
                        ),
                      )
                  )
                ],)

            ],
          )
      ),
      onTap: onTap,
    );
  }
}


class GradientText extends StatelessWidget {
  final String data;
  final Gradient gradient;
  final TextStyle style;
  final TextAlign textAlign;

  GradientText(this.data,
      {@required this.gradient,
        this.style,
        this.textAlign = TextAlign.left
      });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: Text(
        data,
        textAlign: textAlign,
        style: (style == null)
            ? TextStyle(color: Colors.white)
            : style.copyWith(color: Colors.white),
      ),
    );
  }
}