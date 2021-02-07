import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src/tools/export.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '活动',
          style: TextStyle(fontSize: 44.sp, fontWeight: Bold),
        ),
      ),
      backgroundColor: ConfigColor.randomColor(),
      body: Center(
        child: Text(
          '活动主界面',
          style:
              TextStyle(color: Colors.white, fontWeight: Bold, fontSize: 40.sp),
        ),
      ),
    );
  }
}
