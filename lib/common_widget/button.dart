import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final double height;
  final double width;
  final Color color;
  final VoidCallback? onTap;

  const CustomButton({
    super.key,
    required this.content,
    required this.height,
    required this.width,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: content.text.white.semiBold.makeCentered().box
          .color(color)
          .size(width, height)
          .roundedLg
          .make(),
    );
  }
}
