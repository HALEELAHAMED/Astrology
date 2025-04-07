import 'package:flutter/material.dart';

class LeftcalenderButton extends StatelessWidget {
  const LeftcalenderButton({super.key, required this.date, required this.isToday, required this.isSelected, required this.onTap});
  final String date;
  final bool isToday;
  final bool isSelected;
  final VoidCallback onTap; 

  @override
  Widget build(BuildContext context) {

    Color bgColor = Colors.white;
    if (isToday) {
      bgColor = Colors.blue; // highlight today
    } else if (isSelected) {
      bgColor = Colors.purple; // highlight selected
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            date,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
