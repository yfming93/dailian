import 'package:src/tools/export.dart';

double _itemH = 102.w;

 /*
 * //使用如下
   PopSheetWidget.show(_ctx, [PopSheet(0, "拍摄"),PopSheet(1, "相册选择")], (popSheet) async {
      if (popSheet.id == 0) {

      } else  if (popSheet.id == 1) {
      }
    });
 * */

// ignore: must_be_immutable
class PopSheetWidget extends StatelessWidget {
  List<PopSheet> popSheetList;
  Function(PopSheet popSheet) onTap;
  int selectedId;

  PopSheetWidget({@required this.popSheetList, @required this.onTap, @required this.selectedId});

  static Future show(BuildContext context, List<PopSheet> popSheetList, Function(PopSheet popSheet) onTap, {int selectedId}) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)), //
              ),
              child: PopSheetWidget(popSheetList: popSheetList, onTap: onTap, selectedId: selectedId));
        });
  }

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }

  Widget _content(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: popSheetList.length * _itemH,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildListItem(context, popSheetList[index], index),
                  ],
                );
              },
              itemCount: popSheetList.length,
            ),
          ),
          Container(
            color:  Color(0xFFE7E7ED),
            height: 10,
          ),
          Container(
            height: _itemH,
            child: ListTile(
              title: Text('取消', textAlign: TextAlign.center, style: TextStyle(fontWeight: Regular, fontSize: 16, color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            height: ScreenUtil.bottomBarHeight,
          ),
        ],
      ),
    );
  }

  /// 列表的每一行
  Widget _buildListItem(BuildContext context, PopSheet popSheet, int index) {
    return InkWell(
      radius: 20,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.pop(context);
        onTap(popSheet);
      },
      child: Column(
        children: [
          Container(),
          Container(
            alignment: Alignment.center,
            height: _itemH,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                popSheet.icon ?? Container(),
                popSheet.icon != null? SizedBox(width: 20.w,) : SizedBox(width: 0.w,) ,
                Text(
                  popSheet.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: Regular,
                    color: (ObjectUtil.isNotEmpty(selectedId) && popSheet.id == selectedId) ? Color(0xFF025DFB) : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFE7E7ED),
            height: 1,
          ),
        ],
      ),
    );
  }
}

class PopSheet {
  int id;
  String title;
  Widget icon;
  PopSheet(this.id, this.title,[this.icon]);
}
