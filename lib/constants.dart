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

 buildValidatedTextField(
    String label,
    TextEditingController controller, {
      bool obscureText = false,
      String? Function(String?)? validator,
    }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: TextStyle(fontSize: 10, color: Colors.grey[400])),
      SizedBox(height: 5),
      TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}