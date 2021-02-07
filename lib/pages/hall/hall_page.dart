import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src/pages/hall/hall_list_page.dart';
import 'package:src/widget/segment_btn.dart';
import 'package:src/tools/export.dart';

class HallPage extends StatefulWidget {
  @override
  _HallPageState createState() => _HallPageState();
}

class _HallPageState extends State<HallPage> {
  // tab头控制器
  StreamController<int> _streamEnTab;
  // 页面控制器
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _streamEnTab = StreamController<int>();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _favorites(),
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                '大厅',
                style: TextStyle(fontSize: 44.sp, fontWeight: Bold),
              ),
              Expanded(child: Container()),
              _search(),
            ],
          ),
        ),
        backgroundColor: ConfigColor.color_F7F7F7,
        body: Container(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                _buildTab(),
                Expanded(child: _buildContent()),
              ],
            ),
          ),
        ));
  }

  /// 收藏
  Widget _favorites() {
    return Container(
      margin: EdgeInsets.only(bottom: 200.w),
      child: InkWell(
        onTap: () {
          ToastUtils.showText("需要先登才能收藏哦！");
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.w),
          child: Container(
            width: 100.w,
            height: 100.w,
            color: ConfigColor.color_main,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                Text(
                  '收藏',
                  style: TextStyle(
                      color: Colors.white, fontWeight: Bold, fontSize: 24.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 选项卡
  Widget _buildTab() {
    return Container(
      margin: EdgeInsets.only(top: 10.w),
      child: StreamBuilder<int>(
        stream: _streamEnTab.stream,
        builder: (context, snapshot) {
          return SegmentBtn(
            height: 80.w,
            selectIndex: snapshot.data ?? 0,
            titles: ["优质", "标准", "福利", "私有"],
            fontSize: 28.sp,
            fontSelectedSize: 30.sp,
            onChangeTab: (index) {
              _onPageChangedNew(0, index);
            },
            expanded: true,
          );
        },
      ),
    );
  }

  ///             优质 标准 福利 私有
  /// category      2   1   1     1
  /// game          0   0   21    0
  /// group_type    1   1   1     2
  Widget _buildContent() {
    return Container(
      color: ConfigColor.color_main,
      width: double.infinity,
      child: PageView(
          onPageChanged: (index) {
            print('------:$index');
            // _pageController.jumpToPage(index);
            _onPageChangedNew(1, index);
          },
          // physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal, // 横向滑动翻页
          controller: _pageController,
          children: [
            HallListPage(
              category: 2,
              game: 0,
              group_type: 1,
            ),
            HallListPage(
              category: 1,
              game: 0,
              group_type: 1,
            ),
            HallListPage(
              category: 1,
              game: 21,
              group_type: 1,
            ),
            HallListPage(
              category: 1,
              game: 0,
              group_type: 2,
            ),
          ]),
    );
  }

  /// tab切换功能
  void _onPageChangedNew(int from, int index) {
    if (0 == from) {
      _pageController.jumpToPage(index);
    } else {
      _streamEnTab.add(index);
      setState(() {});
    }
  }

  Widget _search() {
    return InkWell(
      onTap: (){
        ToastUtils.showText('搜索功能正在开发中ing');
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        height: 60.w,
        width: 400.w,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.all(Radius.circular(30.w)),
          border: Border.all(
            color: ConfigColor.color_E6E6E6,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Text(
              " 输入标题/关键字/单号/发单人",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.sp),
            ),
            Icon(
              Icons.search,
              size: 36.sp,
              color: ConfigColor.color_main,
            ),
          ],
        ),
      ),
    );
  }
}
