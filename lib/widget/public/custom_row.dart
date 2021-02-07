import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/config/config_color.dart';

enum RowType {
  normal,
  input,
  inputAndPlacehold,
  click,
}

class CustomRow extends StatefulWidget {
  String title;
  String finalTitle;
  String placehold;
  TextEditingController controller;
  RowType type;
  Function onTap;

  CustomRow({@required this.title, this.placehold,this.finalTitle, this.type, this.controller,this.onTap});

  @override
  _CustomRowState createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.w,
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(30),
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(70),
          ),
          _contentWidget(),
        ],
      ),
    );
  }

  Widget _contentWidget() {
    if (widget.type == RowType.input) {
      //  带输入

      return _inputWidget();
    } else if (widget.type == RowType.inputAndPlacehold) {
      // 输入后面带名称
      return _inputWidgetAndFinalTitle();
    } else if (widget.type == RowType.click) {
      // 带点击效果

      return _clickWidget();
    } else {
      //  常用
      return _clickWidget();
    }
  }

  Widget _inputWidget() {
    return Expanded(
      child: Container(
        child: TextField(
          onChanged: (text) {},
          inputFormatters: [
            WhitelistingTextInputFormatter(RegExp("[0-9.]")), //只允许输入小数
          ],
          // keyboardType: TextInputType.number,
          controller: widget.controller,
          autofocus: false,
          maxLines: 1,

          cursorColor: ConfigColor.color_CDCDCD,
          style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.black, textBaseline: TextBaseline.alphabetic),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            hintText: widget.placehold,
            hintStyle: TextStyle(color: ConfigColor.color_CDCDCD, fontSize: ScreenUtil().setSp(30)),
            border: InputBorder.none,
          ),
          obscureText: false,
        ),
      ),
    );
  }

  Widget _inputWidgetAndFinalTitle() {
    return Expanded(child: Row(
      children: [
        Expanded(
          child: Container(
            child: TextField(
              onChanged: (text) {},
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp("[0-9.]")), //只允许输入小数
              ],
              // keyboardType: TextInputType.number,
              controller: widget.controller,
              autofocus: false,
              maxLines: 1,

              cursorColor: ConfigColor.color_CDCDCD,
              style: TextStyle(fontSize: ScreenUtil().setSp(30), color: Colors.black, textBaseline: TextBaseline.alphabetic),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintText: widget.placehold,
                hintStyle: TextStyle(color: ConfigColor.color_CDCDCD, fontSize: ScreenUtil().setSp(30)),
                border: InputBorder.none,
              ),
              obscureText: false,
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
         Container(
            child: Text(
              widget.finalTitle,
              style: TextStyle(
                color: ConfigColor.color_999999,
                fontSize: 30.w,
              ),
            ),
          ),
      ],
    ));
  }

  Widget _clickWidget() {
    return Expanded(
        child: InkWell(
      onTap: widget.onTap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.placehold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ConfigColor.color_CDCDCD,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            )),
            SizedBox(width: ScreenUtil().setWidth(20)),
            Container(
              width: ScreenUtil().setWidth(16),
              height: ScreenUtil().setWidth(30),
              child: Image.asset(
                'images/right_arrow_icon.png',
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
