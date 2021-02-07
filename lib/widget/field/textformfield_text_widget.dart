import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:src/config/config_color.dart';
import 'package:src/tools/export.dart';

class TextformfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final List<TextInputFormatter> inputFormatters;
  final FocusNode focusNode;
  final Widget leftview;
  final Widget rightview;
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final bool isPrompt;
  final int fontSize;
  final String promptText;

  final TextInputAction textInputAction;
  Function validator;
  Function onChanged;
  TextformfieldWidget({
    Key key,
    this.controller,
    this.inputFormatters,
    this.isPassword = false,
    this.keyboardType,
    this.hintText,
    this.rightview,
    this.leftview,
    this.promptText,
    this.focusNode,
    this.textInputAction,
    this.isPrompt = false,
    this.fontSize = 36,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10.w),
            child: Stack(
              children: <Widget>[
                Container(
                  child: TextFormField(
                    controller: controller,
                    keyboardType: keyboardType,
                    obscureText: isPassword,
                    textInputAction: textInputAction==null?TextInputAction.done:textInputAction,
                    inputFormatters: inputFormatters,
                    onChanged:(x){
                      if (onChanged != null) {
                        onChanged(x);
                      }
                    } ,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: ObjectUtil.isNotEmpty(leftview) ? 230.w : 0,
                        right: ObjectUtil.isNotEmpty(rightview) ? 150.w : 0,
                        // top: 25.w,
                        // bottom: 25.w,
                      ),
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontSize: fontSize?.sp,
                        color: ConfigColor.color_CDCDCD,
                        fontWeight: Regular,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ConfigColor.color_CDCDCD),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ConfigColor.color_025DFB),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: fontSize?.sp,
                      color: ConfigColor.color_11121A,
                      fontWeight: Regular,
                    ),
                    validator: validator,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0.w,
                  child: Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: leftview,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0.w,
                  child: Container(
                    height: 50,
                    alignment: Alignment.centerRight,
                    child: rightview,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.w,
          ),
          Text(
            isPrompt ? '$promptText' : '',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 26.sp,
              color: ConfigColor.color_main,
            ),
          ),
        ],
      ),
    );
  }

  Widget textField() {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize?.sp,
          color: ConfigColor.color_CDCDCD,
          fontWeight: Regular,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ConfigColor.color_CDCDCD),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ConfigColor.color_025DFB),
        ),
      ),
      style: TextStyle(
        fontSize: fontSize?.sp,
        color: ConfigColor.color_11121A,
        fontWeight: Regular,
      ),
      validator: validator,
    );
  }
}
