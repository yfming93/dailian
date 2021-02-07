
import 'package:bot_toast/src/toast_widget/animation.dart';
import 'package:src/tools/export.dart';

class ToastUtils {

  static Color _TOAST_BG_COLOR = Color(0xBF000000);
  static Color _TOAST_TXT_COLOR = Colors.white;

  ///
  /// 文字toast
  ///
  static CancelFunc showText(String text, {bool showSuccess}) {
    text = "$text";
    double width;
    if(ObjectUtil.isNotEmpty(text) && text.length > 15){
      //text = text.substring(0, 15) + '...';
      width = 230.h;
    }
    List<Widget> list = [];
    if(null == showSuccess){

    }
    else if(showSuccess){
      list.add(
          Icon(
            Icons.check_circle,
            size: 16.0,
            color: _TOAST_TXT_COLOR,
          )
      );
      list.add(SizedBox(width: 6.w));
    }
    else{
      list.add(
        Icon(
          Icons.cancel,
          size: 16.0,
          color: _TOAST_TXT_COLOR,
        )
      );
      list.add(SizedBox(width: 6.w));
    }

    list.add(
      Container(
        width: width,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            color: _TOAST_TXT_COLOR,
          ),
        ),
      )

    );

    dismiss();
    return BotToast.showCustomText(
      onlyOne: true,
      crossPage: true,
      wrapToastAnimation: loadingAnimation,
      toastBuilder: (CancelFunc cancelFunc) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: _TOAST_BG_COLOR,
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: list,
            ),
          ),
        );
      },
    );
  }

  ///
  /// 文字toast
  ///
  static CancelFunc showSuccessText(String text){
    return showText(text, showSuccess: true);
  }

  ///
  /// 文字toast
  ///
  static CancelFunc showFailureText(String text){
    return showText(text, showSuccess: false);
  }

  ///
  /// 展示等待loading
  ///
  static CancelFunc showLoading() {
    dismiss();
    return BotToast.showCustomLoading(toastBuilder: (context) {
      return Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            padding: EdgeInsets.all(25),
            width: 70.w,
            height: 70.w,
            color: Colors.transparent,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    });
  }

  ///
  /// 展示等待loading
  ///
  static CancelFunc showLoading1() {
    dismiss();
    return BotToast.showCustomLoading(toastBuilder: (CancelFunc cancelFunc) {
      return Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            padding: EdgeInsets.all(25),
            width: 90.w,
            height: 90.w,
            color: Colors.black.withOpacity(0.9),
            child: CircularProgressIndicator(),
          ),
        ),
      );
    });
  }

  ///
  /// 取消等待loading
  ///
  static void dismiss({bool showAnim = true}) {
    BotToast.closeAllLoading();
  }

}
