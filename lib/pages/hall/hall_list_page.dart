import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src/model/hall/hall_model.dart';
import 'package:src/pages/hall/hall_detail_page.dart';
import 'package:src/tools/export.dart';
import 'package:src/widget/public/empty.dart';
import 'package:src/widget/public/user_avatar_widget.dart';

class HallListPage extends StatefulWidget {
  int category;
  int game;
  int group_type;

  HallListPage({this.category = 2, this.game = 0, this.group_type = 1});

  @override
  _HallListPageState createState() => _HallListPageState();
}

class _HallListPageState extends State<HallListPage> {
  List _data = [];
  int page = 1;
  int page_size = 15;

  ///             优质 标准 福利 私有
  /// category      2   1   1     1
  /// game          0   0   21    0
  /// group_type    1   1   1     2

  EasyRefreshController _refreshController = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    _waitList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: EasyRefresh(
              controller: _refreshController,
              header: Refresh.getHeader(),
              footer: Refresh.getFooter(),
              onRefresh: () async {
                page = 0;
                _data.clear();
                _refreshController.finishLoad(noMore: false);
                _waitList();
              },
              onLoad: () async {
                page++;
                _waitList();
              },
              emptyWidget: _data.length == 0 ? EmptyWidget() : null,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return _listItem(_data[index]);
                },
                itemCount: _data.length,
              ),
            )));
  }

  Widget _listItem(HallModel model) {
    return Container(
      height: 160.w,
      margin: EdgeInsets.symmetric(vertical: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: () {
          Get.to(HallDetailPage(
            trade_no: model.tradeNo,
          ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 30.w,
            ),
            UserAvatarWidget(
              model?.game?.icon ?? 'http://picsum.photos/400/100',
              size: 100.w,
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Text(
                        model?.gameRegion?.name ?? '',
                        style: TextStyle(
                            color: ConfigColor.color_main,
                            fontWeight: Regular,
                            fontSize: 26.sp),
                      ),
                      Expanded(
                          child: Text(
                        model?.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: Medium,
                            fontSize: 26.sp),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        (model?.game?.name ?? '') +
                            ' | ' +
                            (model?.gameRegion?.name ?? '') +
                            ' | ' +
                            (model?.hour.int0 ?? '') +
                            '小时' +
                            ' | ' +
                            (model?.totalDeposit.int0 ?? '') +
                            '元保证金',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: Regular,
                            fontSize: 22.sp),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          child: Icon(
                        Icons.person,
                        size: 30.w,
                        color: ConfigColor.color_main,
                      )),
                      Text(
                        model?.username ?? '',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: Regular,
                            fontSize: 24.sp),
                      ),
                      Expanded(child: Container()),
                      Text(
                        '￥47',
                        style: TextStyle(
                            color: ConfigColor.color_main,
                            fontWeight: Bold,
                            fontSize: 26.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 30.w,
            ),
          ],
        ),
      ),
    );
  }

  void _waitList() async {
    Map<String, dynamic> map = {
      'page': page,
      'page_size': page_size,
      'category': widget.category,
      'group_type': widget.group_type,
      'game': widget.game
    };
    await DioUtils.instance
        .getRequest(
      url: HttpPath.waitList,
      queryParameters: map,
    )
        .then((x) {
      if (x.success) {
        List<HallModel> models = x.data['data'].map<HallModel>((e) {
          return HallModel.fromJson(e);
        }).toList();
        setState(() {
          _data.addAll(models);
          if (models.length == 0) {
            _refreshController.finishLoad(noMore: true);
          }
        });
      } else {
        ToastUtils.showText(x.message);
        _refreshController.finishLoad(noMore: false);
      }
    });
  }
}
