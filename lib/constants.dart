import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const Color darkGrayText = Color(0xFF4A4A4A);

loadingAnimation(double size) {
  return Center(
    child: LoadingAnimationWidget.discreteCircle(
      color: Colors.blue,
      size: size,
    ),
  );
}

InputDecoration inputDecoration({Widget? suffixIcon}) {
  OutlineInputBorder borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: Color(0xFFEFEFEF),),
  );

  return InputDecoration(
    filled: true,
    fillColor: Color(0xFFEFEFEF),
    contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    enabledBorder: borderStyle,
    focusedBorder: borderStyle,
    errorBorder: borderStyle.copyWith(borderSide: BorderSide(color: Colors.red)),
    focusedErrorBorder: borderStyle.copyWith(borderSide: BorderSide(color: Colors.red)),
    suffixIcon: suffixIcon,
  );
}