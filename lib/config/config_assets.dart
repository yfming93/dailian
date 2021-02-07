class AppAssets {
  /// 加载图片，相对目录:assets/images/下
  static String images(String imageName) {
    return "images/$imageName";
  }

  /// 加载图片，相对目录/images/下
  static String mine(String imageName) {
    return "images/mine/$imageName.png";
  }

}