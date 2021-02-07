import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src/tools/export.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('代练丸子',style: TextStyle(fontSize: 44.sp,fontWeight: Bold),),
        ),
        backgroundColor: ConfigColor.randomColor(),
      body: Center(
        child: Text('代练丸子主界面',style: TextStyle(color: Colors.white,fontWeight: Bold,fontSize: 40.sp),),
      ),
    );
  }









}
