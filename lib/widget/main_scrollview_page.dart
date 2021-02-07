import 'package:flutter/material.dart';

class MainScrollView extends StatefulWidget {

 PageController controller;
 Function onPageChanged;
 Axis scrollDirection;
 List<Widget> children;
 
  MainScrollView({Key key,this.controller,this.onPageChanged,this.children,this.scrollDirection}) : super(key: key);

  _MainScrollViewState createState() => _MainScrollViewState(controller: this.controller,children: this.children,onPageChanged: this.onPageChanged,scrollDirection:this.scrollDirection);
}

class _MainScrollViewState extends State<MainScrollView> {

  PageController controller;
  Function onPageChanged;
   List<Widget> children;
    Axis scrollDirection;

  _MainScrollViewState({this.controller,this.onPageChanged,this.children,this.scrollDirection});


  void anmaintJump(){
     
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: PageView(
        scrollDirection: this.scrollDirection,
        reverse: false,
        controller: controller,
        physics: BouncingScrollPhysics(),
        pageSnapping: true,
        onPageChanged: (int index){
         if (onPageChanged != null) {
           onPageChanged(index);
         } 
        },
        children: widget.children
      ),
    );
  }

  
}
