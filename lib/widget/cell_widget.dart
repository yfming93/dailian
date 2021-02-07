import 'package:flutter/cupertino.dart';
import 'package:src/tools/export.dart';

class CellWidget extends StatefulWidget {
  String title;
  String subtitle;
  Widget trailing;
  Widget leading;
  bool showArrow;
  EdgeInsetsGeometry padding;
  GestureTapCallback callback;

  CellWidget(this.title, {this.subtitle, this.leading, this.trailing, this.showArrow,this.padding, this.callback});

  @override
  _CellWidgetState createState() => _CellWidgetState();
}

class _CellWidgetState extends State<CellWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (widget.callback != null) {
          widget.callback();
        }
      },
      child: Container(
        height: 102.w,
        color: Colors.white,
        padding: widget.padding ??EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 0.5,
            ),
            Row(
              children: [
                _leading(),
                Text(
                  widget.title ?? "",
                  style: TextStyle(color: Color(0xFF11121A), fontSize: 30.sp),
                ),
                Expanded(child: Container()),
                widget.trailing ?? _subTitleArrow()
              ],
            ),
            Container(
              height: 0.5,
              color: widget.showArrow == false ? Colors.transparent : Color(0xFFE6E6E6),
            ),
          ],
        ),
      ),
    );
  }

  Widget _leading (){
    if (widget.leading == null) {
      return Container();
    }
    return Row(
      children: [
        widget.leading,
        SizedBox(width: 20.w,)
      ],
    );
  }

  Widget _subTitleArrow() {
    return Row(children: [
      Text(
        widget.subtitle ?? "",
        style: TextStyle(color: Color(0xFF999999), fontSize: 30.sp),
      ),
      SizedBox(
        width: 8.w,
      ),
      Icon(
        Icons.keyboard_arrow_right,
        color: Colors.grey,
      ),
    ]);
  }
}
