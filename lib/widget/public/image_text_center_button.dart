import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageTextCenterButton extends StatelessWidget {
  final Widget image;
  final Widget title;
  GestureTapCallback onTap;
  double space;

  ImageTextCenterButton({
    @required this.title,
    this.image,
    this.space = 8,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
//        radius: 0,
//        highlightColor: Colors.transparent,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildImage(context),
            SizedBox(height: space),
            title,
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  Widget buildImage(BuildContext context) {
    if (image == null) {
      return Container(
        width: 25,
        height: 25,
        color: Colors.white54,
      );
    }
    return image;
  }
}
