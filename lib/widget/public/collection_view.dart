import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/tools/export.dart';

class CollectionWidget extends StatefulWidget {
  List dataSource;
  Function onClick;

  CollectionWidget({
    @required this.dataSource,
    this.onClick,
    Key key,
  }) : super(key: key);

  _CollectionWidgetState createState() => _CollectionWidgetState();
}

class _CollectionWidgetState extends State<CollectionWidget> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
      child: Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.spaceEvenly,
        spacing: 20.w,
        runSpacing: 20.w,
        children: List<Widget>.generate(widget.dataSource.length, (int index) {
          return _item(index);
        }),
      ),
    );
  }

  Widget _item(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if (widget.onClick != null) {
            widget.onClick(index);
          }
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(150),
        height: ScreenUtil().setWidth(60),
        decoration: BoxDecoration(color: selectedIndex == index ? ConfigColor.color_025DFB : ConfigColor.color_E8F3FF, borderRadius: BorderRadius.circular(ScreenUtil().setWidth(6))),
        child: Text(
          widget.dataSource[index],
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(22),
            color: selectedIndex == index ? ConfigColor.color_FFFFFF : ConfigColor.color_999999,
          ),
        ),
      ),
    );
  }
}
