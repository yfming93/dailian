import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';

class Refresh {
  static ClassicalHeader getHeader () {
    return ClassicalHeader(
      showInfo: false,
      infoColor: Color(0xFFC8C8C8),
      textColor: Color(0xFFC8C8C8),
      refreshText:"下拉刷新",
      refreshReadyText:"释放刷新",
      refreshingText:"刷新中..." ,
      refreshedText:"刷新完成",
      refreshFailedText:'刷新失败',
      noMoreText: '没有更多数据了',
    );
  }
  static ClassicalFooter getFooter() {
    return ClassicalFooter(
      showInfo: false,
      infoColor: Color(0xFFC8C8C8),
      textColor: Color(0xFFC8C8C8),
      loadText: '上滑加载',
      loadReadyText: '上滑加载',
      loadingText: '正在加载...',
      loadedText: '正在加载...',
      loadFailedText: '加载失败',
      noMoreText: '没有更多数据了',
    );
  }
}

/*

 */
