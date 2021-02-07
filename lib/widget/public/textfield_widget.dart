import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextField extends StatefulWidget {
  final bool enabled;
  final Widget leftView;
  final Widget rightView;
  final String placeholder;
  final double placeholderFontSize;
  final EdgeInsets contentPadding;
  final Color placeholderColor;
  final Color textColor;
  double textColorFontSize;
  final int maxLength;
  final int maxLines;
  final double width;
  final double height;
  final List<TextInputFormatter> inputFormatters;
  final bool isPassword;
  final Widget clearImage;
  final VoidCallback clearAction;
//  final bool isShowError;
//  final String inputHelperText;
  final FocusNode inputFocusNode;
  final TextInputType keyboardType;
  final TextEditingController inputController;
  final Function(String value) onChange;
  final Function(String value) onSubmitted;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double radius;
  final TextAlign textAlign;
  final TextInputAction textInputAction;

  InputTextField({
    Key key,
    this.enabled = true,
    this.leftView,
    this.textInputAction,
    this.rightView,
    this.contentPadding,
    this.placeholder,
    this.placeholderFontSize = 15.0,
    this.placeholderColor,
    this.textColor = Colors.black,
    this.textColorFontSize = 15.0,
    this.maxLength,
    this.maxLines,
    this.width = 0.0,
    this.height = 0.0,
    this.inputFormatters,
    this.isPassword = false,
    this.clearImage,
//    this.isShowError = false,
//    this.inputHelperText,
    this.inputFocusNode,
    this.keyboardType,
    this.inputController,
    this.onChange,
    this.onSubmitted,
    this.clearAction,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.radius,
    this.textAlign,
  }) : super(key: key);

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _clearShow = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: this.widget.backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 6)),
          border: Border.all(
            color: this.widget.borderColor ?? Colors.transparent,
            width: this.widget.borderWidth ?? 1,
          )),
      child: Row(
        children: [
          Offstage(
            offstage: (widget.leftView == null) ? true : false,
            child: Container(
              alignment: Alignment.center,
              child: widget.leftView,
            ),
          ),
          Expanded(
            child: Container(
              width: widget.width > 0 ? widget.width : 200.0,
              height: widget.height > 0 ? widget.height : 48.0,
              child: textField(),
            ),
          ),
          // )
          Offstage(
            offstage: (widget.rightView == null) ? true : false,
            child: Container(
              child: widget.rightView,
            ),
          ),
        ],
      ),
    );
  }

  Widget textField() {
    return TextField(
      textAlign: widget.textAlign??TextAlign.left,
      enabled: widget.enabled,
      controller: widget.inputController,
      focusNode: widget.inputFocusNode,
      maxLines: widget.maxLines, //为 null 是不限制行数,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType ?? TextInputType.multiline,
      style: TextStyle(
        color: widget.textColor ?? Colors.white,
        fontSize: widget.textColorFontSize,
      ),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1)
          ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1)),

        // fillColor: Colors.red,
                //  filled: true,
        contentPadding: widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 10),
        hintText: widget.placeholder ?? "",
        counterText: '',
        hintStyle: TextStyle(
          color: this.widget.placeholderColor ?? Colors.white,
          fontSize: widget.placeholderFontSize > 0
              ? widget.placeholderFontSize
              : 14.sp,
        ),
        border: InputBorder.none,
        suffixIcon: this.widget.clearImage != null
            ? _clearShow
                ? IconButton(
                    icon: this.widget.clearImage ?? Icon(Icons.clear),
                    onPressed: () {
                      this.widget.inputController.clear();
                      _clearShow = false;
                      setState(() {});
                      if (widget.clearAction != null) {
                        widget.clearAction();
                      }
                    },
                  )
                : null
            : null,
      ),
      autofocus: false,
      obscureText: widget.isPassword,
      inputFormatters: widget.inputFormatters,
      onChanged: (String value) {
        if (value.length > 0) {
          _clearShow = true;
        } else {
          _clearShow = false;
        }
        setState(() {});
        widget.onChange(value);
      },
      onSubmitted:(str){
        print("str");
        widget.onSubmitted(str);
      },
      textInputAction:widget.textInputAction!=null?widget.textInputAction:TextInputAction.done
//        onEditingComplete:(){
//          widget.inputFocusNode.unfocus();
//        },
    );
  }
}
