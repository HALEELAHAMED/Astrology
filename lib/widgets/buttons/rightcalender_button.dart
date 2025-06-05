import 'package:astrology/global/global_width.dart';
import 'package:flutter/material.dart';

class RightcalenderButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;

  const RightcalenderButton({super.key, required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: ClipOval(child: Image.asset(imagePath, fit: BoxFit.cover)),
      ),
    );
  }
}
