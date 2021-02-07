import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src/tools/export.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '订单',
          style: TextStyle(fontSize: 44.sp, fontWeight: Bold),
        ),
      ),
      backgroundColor: ConfigColor.randomColor(),
      body: Center(
        child: Text(
          '订单主界面',
          style:
              TextStyle(color: Colors.white, fontWeight: Bold, fontSize: 40.sp),
        ),
      ),
    );
  }
}
