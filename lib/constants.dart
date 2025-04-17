import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
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

Widget buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
    ) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "•  ",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (subtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        subtitle,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                ],
              ),
            ),
            FlutterSwitch(
              width: 42.0,
              height: 22.0,
              toggleSize: 18.0,
              value: value,
              borderRadius: 20.0,
              activeColor: Colors.black,
              inactiveColor: Colors.grey.shade400,
              toggleColor: Colors.white,
              padding: 2.0,
              onToggle: onChanged,
            ),
          ],
        ),
        SizedBox(height: 12),
      ],
    ),
  );
}