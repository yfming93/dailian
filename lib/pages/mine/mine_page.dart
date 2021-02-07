import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src/tools/export.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我的',
          style: TextStyle(fontSize: 44.sp, fontWeight: Bold),
        ),
      ),
      backgroundColor: ConfigColor.randomColor(),
      body: Center(
        child: Text(
          '我的主界面',
          style:
              TextStyle(color: Colors.white, fontWeight: Bold, fontSize: 40.sp),
        ),
      ),
    );
  }
}
