import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:src/model/hall/hall_order_model.dart';
import 'package:src/tools/export.dart';
import 'package:src/widget/dash_line.dart';

class HallDetailPage extends StatefulWidget {
  String trade_no;
  HallDetailPage({@required this.trade_no});

  @override
  _HallDetailPageState createState() => _HallDetailPageState();
}

class _HallDetailPageState extends State<HallDetailPage> {
  HallOrderModel model;

  @override
  void initState() {
    super.initState();
    _show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '订单详情',
            style: TextStyle(fontSize: 44.sp, fontWeight: Bold),
          ),
        ),
        backgroundColor: ConfigColor.color_F7F7F7,
        body: SafeArea(
          child: Container(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Expanded(child: _content()),
                    _bottom(),
                  ],
                ),
              ),
            ),
        ),
        );
  }

  Widget _content() {
    return Container(
      child: ListView(
        children: [
          _topStack(),
          _ad(),
          _showInfo(),
          Row(
            children: [
              Expanded(child: _tipItems('代练要求', model?.requirement)),
            ],
          ),
          Row(
            children: [
              Expanded(child: _tipItems('代练说明', model?.explain)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tipItems(String title, String text) {
    return Container(
      margin: EdgeInsets.fromLTRB(30.w, 0.w, 30.w, 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 30.w, top: 30.w),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black, fontWeight: Bold, fontSize: 32.w),
              )),
          Container(
              padding: EdgeInsets.all(30.w),
              child: Text(
                text ?? "",
                style: TextStyle(
                    color: Colors.grey, fontWeight: Regular, fontSize: 22.w),
              ))
        ],
      ),
    );
  }

  Widget _showInfo() {
    return Container(
      margin: EdgeInsets.fromLTRB(30.w, 10.w, 30.w, 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w), color: Colors.white),
      height: 340.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _infoLine('订单编号：', model?.tradeNo ?? "-", true),
          _infoLine('代练时长：', (model?.hour?.int0 ?? "-") + "小时"),
          _infoLine('安全保证金：', (model?.securityDeposit?.int0 ?? "-") + "元"),
          _infoLine('效率保证金：', (model?.efficiencyDeposit?.int0 ?? "-") + "元"),
          _infoLine('发单人：', (model?.username ?? "-")),
        ],
      ),
    );
  }

  Widget _infoLine(String title, String text, [bool needCopy = false]) {
    return Container(
      height: 60.w,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 0,
          ),
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.grey, fontWeight: Medium, fontSize: 24.w),
              ),
              Expanded(child: Container()),
              Text(
                text,
                style: TextStyle(
                    color: Colors.grey, fontWeight: Medium, fontSize: 24.w),
              ),
              needCopy == true ? _copy(text) : Container()
            ],
          ),
          DashLine(
            dashWidth: 10.w,
            height: 0.5,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _copy(String str) {
    return InkWell(
      onTap: () {
        str.copyToClipboard;
        ToastUtils.showText('已复制：' + str);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.w),
        width: 80.w,
        height: 35.w,
        decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: ConfigColor.color_main),
            borderRadius: BorderRadius.circular(4.w)),
        child: Center(
          child: Text(
            '复制',
            style: TextStyle(
                color: ConfigColor.color_main,
                fontWeight: Medium,
                fontSize: 22.w),
          ),
        ),
      ),
    );
  }

  Widget _topStack() {
    return Stack(
      children: [
        Container(
          height: 260.w,
        ),
        Container(
          height: 180.w,
          padding: EdgeInsets.all(30.w),
          color: ConfigColor.color_main,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model?.status == "13" ? "已接单" : '未接单',
                style: TextStyle(
                    color: Colors.white, fontWeight: Bold, fontSize: 32.w),
              ),
              Expanded(child: Container()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(
                    '￥',
                    style: TextStyle(
                        color: Colors.white, fontWeight: Bold, fontSize: 24.w),
                  ),
                  Text(
                    (model?.amount ?? "-") + '元',
                    style: TextStyle(
                        color: Colors.white, fontWeight: Bold, fontSize: 32.w),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 100.w,
          right: 30.w,
          left: 30.w,
          bottom: 0,
          child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.w),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (model?.gameRegion?.name ?? '') +
                        " " +
                        (model?.title ?? ''),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: Medium,
                      fontSize: 25.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        (model?.game?.name ?? '') +
                            "/" +
                            (model?.gameRegion?.name ?? '') +
                            "/" +
                            (model?.gameServer?.name ?? ''),
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: Regular,
                            fontSize: 24.sp),
                      ),
                      Expanded(child: Container()),
                      Text(
                        (model?.createdAt ?? ''),
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: Regular,
                            fontSize: 24.sp),
                      ),
                    ],
                  )
                ],
              )),
        )
      ],
    );
  }

  Widget _ad() {
    return Container(
        padding: EdgeInsets.fromLTRB(30.w, 15.w, 30.w, 10.w),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12.w),
            child: CachedNetworkImage(imageUrl: model?.adImg ?? "")));
  }

  Widget _bottom() {
    return Container(
      height: 100.w,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _functionAction(
                      Icon(
                        Icons.share_outlined,
                        color: ConfigColor.color_main,
                      ),
                      '分享', () {
                    Share.share(HttpPath.detail + model.tradeNo);
                  }),
                  _functionAction(
                      Icon(
                        Icons.star_border_rounded,
                        color: ConfigColor.color_main,
                      ),
                      '收藏', () {
                    ToastUtils.showText("需要登录后才能收藏哦！");
                  }),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                ToastUtils.showText("正在开发中ing");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: model?.status == "13" ? Colors.grey : ConfigColor.color_main,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      model?.status == "13" ? "该订单已被接" : '立即接单',
                      style: TextStyle(
                          color: Colors.white, fontWeight: Bold, fontSize: 32.w),
                    ),
                    Text(
                      model?.status == "13" ? "去大厅看看其他订单吧"  :('需要冻结' + (model?.totalDeposit?.int0 ?? "-") + '元'),
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: Regular,
                          fontSize: 24.w),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _functionAction(Widget icon, String name, var callback) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 100.w,
        height: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(
              name,
              style: TextStyle(
                  color: ConfigColor.color_main,
                  fontWeight: Bold,
                  fontSize: 24.sp),
            )
          ],
        ),
      ),
    );
  }

  void _show() async {
    Map<String, dynamic> map = {
      'trade_no': widget.trade_no,
    };
    await DioUtils.instance
        .getRequest(
      url: HttpPath.show,
      queryParameters: map,
    )
        .then((x) {
      if (x.success) {
        HallOrderModel models = HallOrderModel.fromJson(x.data);
        setState(() {
          model = models;
        });
      } else {
        ToastUtils.showText(x.message);
      }
    });
  }
}
