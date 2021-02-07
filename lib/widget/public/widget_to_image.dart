import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

/// create by 张风捷特烈 on 2020/6/21
/// contact me by email 1981462002@qq.com
/// 说明:


class Widget2Image extends StatefulWidget {
  final Widget child;
  final ui.ImageByteFormat format;
  final bool isSave;

  Widget2Image(
      {@required this.child,
      this.isSave = true,
      this.format = ui.ImageByteFormat.rawRgba});

  @override
  Widget2ImageState createState() => Widget2ImageState();


  static Widget2ImageState of(BuildContext context) {
    final Widget2ImageState result = context.findAncestorStateOfType<Widget2ImageState>();
    if (result != null)
      return result;
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
          'Widget2Image.of() called with a context that does not contain a Widget2Image.'
      ),
    ]);
  }
}

class Widget2ImageState extends State<Widget2Image> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: widget.child,
    );
  }

  Future<Uint8List> loadImage() {
    return _widget2Image(_globalKey);
  }

  Future<Uint8List> _widget2Image(GlobalKey key) async {
    RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
    //获得 ui.image
    ui.Image img = await boundary.toImage();
    //获取图片字节
    var byteData = await img.toByteData(format: widget.format);
    Uint8List bits = byteData.buffer.asUint8List();
    return bits;
  }
}
