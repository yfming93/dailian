
import '../tools/export.dart';

class MenuActionWidget extends StatefulWidget {
  List<String> titles; // 标题
  Color selectColor; // 选中字体颜色
  Color normalColor; //  默认颜色
  Color indicatorColor; //  指示器颜色
  int currentIndex;
  Function onTap; // 点击
  double indicatorWidth;
  double indicatorHeight;
  double fontSize;
  double selectFontSize; //新增字段，选择状态字号
  double marginWidth; // 间距
  FontWeight fontWeight;

  MenuActionWidget(
      {Key key,
      this.selectColor,
      this.normalColor,
      this.indicatorColor,
      this.onTap,
      this.titles,
      this.indicatorWidth = 27,
      this.indicatorHeight = 6,
      this.fontSize,
      this.selectFontSize,
      this.fontWeight,
      this.marginWidth = 30,
      this.currentIndex = 0})
      : super(key: key);

  _MenuActionWidgetState createState() => _MenuActionWidgetState(
      titles: this.titles,
      selectColor: this.selectColor,
      normalColor: this.normalColor,
      indicatorColor: this.indicatorColor,
      currentIndex: this.currentIndex,
      indicatorWidth: this.indicatorWidth,
      indicatorHeight: this.indicatorHeight,
      fontSize: this.fontSize,
      selectFontSize: this.selectFontSize,
      marginWidth: this.marginWidth,
      fontWeight: this.fontWeight,
      onTap: this.onTap);
}

class _MenuActionWidgetState extends State<MenuActionWidget> {
  List<String> titles; // 标题
  Color selectColor; // 选中字体颜色
  Color normalColor; //  默认颜色
  Color indicatorColor; //  指示器颜色
  Function onTap; // 点击
  int currentIndex;
  double indicatorWidth;
  double indicatorHeight;
  double marginWidth;
  double fontSize;
  double selectFontSize;
  FontWeight fontWeight;

  _MenuActionWidgetState(
      {this.selectColor,
      this.normalColor,
      this.titles,
      this.indicatorColor,
      this.currentIndex,
      this.indicatorHeight,
      this.indicatorWidth,
      this.fontSize,
      this.selectFontSize,
      this.fontWeight,
      this.marginWidth,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: marginWidth),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                        if (onTap != null) {
                          onTap(index);
                        }
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            titles[index],
                            style: TextStyle(
                                color: widget.currentIndex == index
                                    ? widget.selectColor
                                    : widget.normalColor,
                                fontSize: widget.currentIndex == index
                                    ? (selectFontSize == null
                                        ? FontSizeConfig.sp42
                                        : selectFontSize)
                                    : fontSize,
                                fontWeight: fontWeight),
                          ),
                        ),
                      ],
                    )),
                // SizedBox(
                //   height: ScreenUtil().setWidth(5),
                // ),
                // Container(
                //   color:
                //       widget.currentIndex == index ? widget.selectColor : widget.normalColor,
                //   height: indicatorHeight,
                //   width: indicatorWidth,
                // )
              ],
            ),
          );
        },
        itemCount: this.titles.length,
      ),
    );
  }
}
