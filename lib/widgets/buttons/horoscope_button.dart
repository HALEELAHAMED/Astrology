// 

import 'package:astrology/widgets/horscope_dialog.dart';
import 'package:flutter/material.dart';

class HoroscopeButton extends StatefulWidget {
  const HoroscopeButton({super.key});

  @override
  State<HoroscopeButton> createState() => _HoroscopeButtonState();
}

class _HoroscopeButtonState extends State<HoroscopeButton> {
  void showPopupForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const HorscopeDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopupForm(context);
      },
      child: Container(
        width: 280,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            const Icon(Icons.circle, color: Colors.white),
            const SizedBox(width: 40),
            const Text(
              'Your horoscope\n      for today',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}