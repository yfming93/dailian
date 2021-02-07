import 'package:flutter/material.dart';
import 'package:src/tools/export.dart';

class EmptyWidget extends StatefulWidget {

  String content = "";

  EmptyWidget();


  @override
  _EmptyWidgetState createState() => _EmptyWidgetState();
}

class _EmptyWidgetState extends State<EmptyWidget> {

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1000),(){
      widget.content = '没有更多了';
      setState(() {

      });
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20,),
        // Container(
        //   width: 300.w,
        //   height: 300.w,
        //   child: Image.asset(
        //     'images/ic_empty.png',
        //   ),
        // ),
        Text(
          widget.content,
          style: TextStyle(
              fontSize: 26.sp, color: ConfigColor.color_999999),
        ),

      ],
    );
  }
}




