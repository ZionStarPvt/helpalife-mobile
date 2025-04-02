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
