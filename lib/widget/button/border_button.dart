import 'package:src/tools/export.dart';

//
class BorderButton extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final double borderWidth;
  final Color color;

  BorderButton(
      {@required this.title,
      this.onPressed,
      this.fontSize,
      this.borderWidth = 1.5,
      this.color = ConfigColor.color_025DFB,
      this.height=45,
      this.width=150});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: color, width: borderWidth)),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color:color,
            fontSize: this.fontSize ?? 36.sp,
            fontWeight: Medium,
          ),
        ),
      ),
    );
  }
}
