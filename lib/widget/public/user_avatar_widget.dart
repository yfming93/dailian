import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  final String url;
  final double size;

  UserAvatarWidget(
    this.url, {
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: ClipOval(
        child: CachedNetworkImage(
//          width: size,
//          height: size,
          imageUrl: url,
          placeholder: (context, url) => Container(
            color: Colors.white30,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
