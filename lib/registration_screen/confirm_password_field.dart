import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;

  const ConfirmPasswordField({
    super.key,
    required this.controller,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Confirm Password", style: TextStyle(fontSize: 10, color: Colors.grey[400])),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: true,
          validator: (value) {
            if (value != passwordController.text) return 'Passwords do not match';
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}