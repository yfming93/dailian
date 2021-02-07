import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:src/config/config_color.dart';
import 'index_page.dart';

class RootAPP extends StatefulWidget {
  @override
  _RootAPPState createState() => _RootAPPState();
}

class _RootAPPState extends State {
  @override
  Widget build(BuildContext context) {
    //警告:不要随意调整调用BotToastInit函数的位置
    final botToastBuilder = BotToastInit(); //1.调用BotToastInit
    return GetMaterialApp(
      enableLog: true,
      initialRoute: '/',
      theme: ThemeData(
          appBarTheme: AppBarTheme(elevation: 0, centerTitle: true
              // color: ConfigColor.color_F7F7F7,
              ),
          primaryColor: ConfigColor.color_F7F7F7,
          backgroundColor: Colors.white,
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.blue)),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
//        child = myBuilder(context,child);  //do something
        child = botToastBuilder(context, child);
        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()], //2.注册路由观察者
      home: IndexPage(),
    );
  }
}
