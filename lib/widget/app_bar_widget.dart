import 'package:src/tools/export.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final bool showBack;
  final Color backgroundColor;

  AppBarWidget(
      {Key key,
      this.title = '',
      this.actions,
      this.showBack = true,
      this.backgroundColor})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(48.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
//      brightness: Brightness.dark,
      elevation: 0,
      backgroundColor: null != backgroundColor ? backgroundColor : Colors.transparent,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 30.sp,
            color: ConfigColor.color_11121A,
            fontWeight: Medium),
      ),
      leading: this.showBack
          ? IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Image.asset(
                "images/k_line_back.png",
                width: 48.w,
                height: 48.w,
                color: ConfigColor.color_11121A,
              ),
              onPressed: () {
                //退出当前页面
                Navigator.of(context).pop();
              },
            )
          : Container(),
      actions: actions,
    );
  }
}
