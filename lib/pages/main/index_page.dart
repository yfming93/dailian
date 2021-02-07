import 'package:flutter/material.dart';
import 'package:src/pages/hall/hall_page.dart';
import 'package:src/pages/home/home_page.dart';
import 'package:src/pages/mine/mine_page.dart';
import 'package:src/pages/order/order_page.dart';
import 'package:src/tools/export.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State {
  final List<Widget> tabBodies = [
    HomePage(),
    HallPage(),
    OrderPage(),
    HomePage(),
    MinePage(),
  ];

  int currentIndex = 0;
  var currentPage;
  int allUnreadSum = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    final List<BottomNavigationBarItem> bottomTabs = [
      _buildTabBottom(Icon(Icons.home),'首页'),
      _buildTabBottom(Icon(Icons.menu_open),'大厅'),
      _buildTabBottom(Icon(Icons.reorder),'订单'),
      _buildTabBottom(Icon(Icons.message_outlined),'活动'),
      _buildTabBottom(Icon(Icons.person_outline_outlined),'我的'),
    ];

    return Scaffold(
      bottomNavigationBar: Stack(
        children: <Widget>[
          BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: ConfigColor.color_main,
            selectedFontSize: ScreenUtil().setSp(22),
            unselectedItemColor: ConfigColor.color_999999,
            unselectedFontSize: ScreenUtil().setSp(22),
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            items: bottomTabs,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                currentPage = tabBodies[currentIndex];
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          IndexedStack(
            index: currentIndex,
            children: tabBodies,
          ),
        ],
      ),
    );
  }

  /// 创建tab底部选项卡
  BottomNavigationBarItem _buildTabBottom(Icon icon, String title){

    return BottomNavigationBarItem(
        icon: Container(
            width: 24,
            height: 24,
            child: icon
        ),
        activeIcon: Container(
            width: 24,
            height: 24,
            child: icon
        ),
        title: Text(title,
            style: TextStyle(fontSize: 22.sp,fontWeight: Bold),
        )
    );
  }
}
