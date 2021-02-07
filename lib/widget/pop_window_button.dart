// class UtilSharedInstance {
//   // 单例公开访问点
//   factory UtilSharedInstance() =>_sharedInstance();

//   // 静态私有成员，没有初始化
//   static UtilSharedInstance _instance;

//   // 私有构造函数
//   UtilSharedInstance._() {
//     // 具体初始化代码
//   }

//   // 静态、同步、私有访问点
//   static UtilSharedInstance _sharedInstance() {
//     if (_instance == null) {
//       _instance = UtilSharedInstance._();
//     }
//     return _instance;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const int _windowPopupDuration = 300;
const double _kWindowCloseIntervalEnd = 2.0 / 3.0;
const Duration _kWindowDuration = Duration(milliseconds: _windowPopupDuration);

class PopupWindowButton<T> extends StatefulWidget {
  final Function sureTap;
  const PopupWindowButton({
    Key key,
    this.child,
    this.window,
    this.offset = Offset.zero,
    this.elevation = 0.0,
    this.duration = 300,
    this.type = MaterialType.card,
    this.sureTap,
  }) : super(key: key);

  /// 显示按钮button
  final Widget child;

  /// window 出现的位置。
  final Offset offset;

  /// 阴影
  final double elevation;

  /// 需要显示的window
  final Widget window;

  /// 按钮按钮后到显示window 出现的时间
  final int duration;

  final MaterialType type;

  @override
  _PopupWindowButtonState createState() {
    return _PopupWindowButtonState(
      sureTap: this.sureTap,
    );
  }
}

void showWindow<T>({
  @required BuildContext context,
  RelativeRect position,
  @required Widget window,
  double elevation = 8.0,
  int duration = _windowPopupDuration,
  String semanticLabel,
  MaterialType type,
  Function sureTap,
}) {
  Navigator.push(
    context,
    _PopupWindowRoute<T>(
        position: position,
        child: window,
        elevation: elevation,
        duration: duration,
        semanticLabel: semanticLabel,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        type: type,
        // sureTap:sureTap,
    ),
  ).then((value) => {
        if (sureTap != null) {sureTap(0)}
      });
}

class _PopupWindowButtonState<T> extends State<PopupWindowButton> {
  Function sureTap;
  _PopupWindowButtonState({this.sureTap});
  void _showWindow() {
    if (sureTap != null) {
      sureTap(0);
    }
    final RenderBox button = context.findRenderObject();
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(widget.offset, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showWindow<T>(
        context: context,
        window: widget.window,
        position: position,
        duration: widget.duration,
        elevation: widget.elevation,
        type: widget.type,
        sureTap: sureTap);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      radius: 0.0,
      onTap: _showWindow,
      child: widget.child,
    );
  }
}

class _PopupWindowRoute<T> extends PopupRoute<T> {
  _PopupWindowRoute({
    this.position,
    this.child,
    this.elevation,
    this.theme,
    this.barrierLabel,
    this.semanticLabel,
    this.duration,
    this.type = MaterialType.card,
  });

  @override
  Animation<double> createAnimation() {
    return CurvedAnimation(
        parent: super.createAnimation(),
        curve: Curves.linear,
        reverseCurve: const Interval(0.0, _kWindowCloseIntervalEnd));
  }

  final RelativeRect position;
  final Widget child;
  final double elevation;
  final ThemeData theme;
  final String semanticLabel;
  @override
  final String barrierLabel;
  final int duration;
  final MaterialType type;

  @override
  Duration get transitionDuration =>
      duration == 0 ? _kWindowDuration : Duration(milliseconds: duration);

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black26;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final CurveTween opacity =
        CurveTween(curve: const Interval(0.0, 1.0 / 3.0));

    return Builder(
      builder: (BuildContext context) {
        return CustomSingleChildLayout(
          delegate: _PopupWindowLayout(position),
          child: AnimatedBuilder(
              child: child,
              animation: animation,
              builder: (BuildContext context, Widget child) {
                return Opacity(
                  opacity: opacity.evaluate(animation),
                  child: Material(
                    borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil().setWidth(6))),
                    type: type,
                    elevation: elevation,
                    child: child,
                  ),
                );
              }),
        );
      },
    );
  }
}

class _PopupWindowLayout extends SingleChildLayoutDelegate {
  _PopupWindowLayout(this.position);

  // Rectangle of underlying button, relative to the overlay's dimensions.
  final RelativeRect position;

  // We put the child wherever position specifies, so long as it will fit within
  // the specified parent size padded (inset) by 8. If necessary, we adjust the
  // child's position so that it fits.

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // The menu can be at most the size of the overlay minus 8.0 pixels in each
    // direction.
    return BoxConstraints.loose(constraints.biggest);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // size: The size of the overlay.
    // childSize: The size of the menu, when fully open, as determined by
    // getConstraintsForChild.

    // Find the ideal vertical position.
    double y = position.top;

    // Find the ideal horizontal position.
    double x;
    if (position.left > position.right) {
      // Menu button is closer to the right edge, so grow to the left, aligned to the right edge.
      x = size.width - position.right - childSize.width;
    } else if (position.left < position.right) {
      // Menu button is closer to the left edge, so grow to the right, aligned to the left edge.
      x = position.left;
    }
    return Offset(x, y);
  }

  @override
  bool shouldRelayout(_PopupWindowLayout oldDelegate) {
    return position != oldDelegate.position;
  }
}
