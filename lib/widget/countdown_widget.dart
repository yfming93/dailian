import 'dart:async';
import 'package:flutter/material.dart';
import 'package:src/tools/export.dart';


final int _defaultCount = -1;

/// 倒计时控制
class CountdownController {
  _CountdownWidgetState _state;

  void bindState(_CountdownWidgetState state) {
    _state = state;
  }

  void dispose() {
    _state = null;
  }

  void setEnable(bool enable) {
    _state?.setEnable(enable);
  }

  /// 开始倒计时
  void startTimer() {
    _state?._startTimer();
  }
}

/// 倒计时按钮
class CountdownWidget extends StatefulWidget {
  final CountdownController controller;
  final int maxValue;
  final VoidCallback onTap;
  final bool enable;
  final String normalText;

  CountdownWidget(
      {this.maxValue = 60, this.onTap, this.controller, this.enable = true, this.normalText = "获取验证码"});

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState(enable);
}

class _CountdownWidgetState extends State<CountdownWidget> {
  Timer _timer;
  int _count;
  bool enable;

  _CountdownWidgetState(this.enable);

  @override
  void initState() {
    super.initState();
    _count = -1;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.controller != null) {
      widget.controller.bindState(this);
    }
  }

  @override
  Widget build(BuildContext context) {
    var onPressed;
    if (enable) {
      onPressed = (_count == _defaultCount) ? widget.onTap : null;
    } else {
      onPressed = null;
    }

    return Container(
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          (_count == _defaultCount) ? widget.normalText : '$_count s',
          style: TextStyle(color: ConfigColor.color_025DFB,fontSize: 26.sp),
        ),

        // disabledColor: rgba(178, 178, 178, 1),
      ),
    );
  }

  void _startTimer() {
    if (_timer == null) {
      _count = widget.maxValue;
      _timer = Timer.periodic(Duration(seconds: 1), update);
      update(_timer);
    } else {
    }
  }

  void update(Timer timer) {
    if (_count == _defaultCount) {
      _timer.cancel();
      _timer = null;
    } else {
      setState(() {
        _count--;
      });
    }
  }

  void setEnable(bool enable) {
    setState(() {
      this.enable = enable;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.controller.dispose();
    super.dispose();
  }
}
