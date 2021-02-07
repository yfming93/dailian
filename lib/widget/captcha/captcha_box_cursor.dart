import 'package:flutter/material.dart';

///
/// des: 模拟光标
///
class CaptchaBoxCursor extends StatefulWidget {
  CaptchaBoxCursor({this.color, this.width, this.indent, this.endIndent});

  ///
  /// 光标颜色
  ///
  final Color color;

  ///
  /// 光标宽度
  ///
  final double width;

  ///
  /// 光标距离顶部距离
  ///
  final double indent;

  ///
  /// 光标距离底部距离
  ///
  final double endIndent;

  @override
  State<StatefulWidget> createState() => _CaptchaBoxCursorState();
}

class _CaptchaBoxCursorState extends State<CaptchaBoxCursor>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          });
    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: VerticalDivider(
        thickness: widget.width,
        color: widget.color,
        indent: widget.indent,
        endIndent: widget.endIndent,
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
