import 'package:astrology/global/global_width.dart';
import 'package:flutter/material.dart';

class BottomBox extends StatelessWidget {
  const BottomBox({
    super.key,
    required this.color,
    required this.title,
    required this.time,
  });
  final String title;
  final Color color;
  final String time;
  
  
  @override
  Widget build(BuildContext context) {
    double scaleFactor = ScreenSize.width / 1200; // 1200 is a base tablet width

double dynamicWidth = 190 * scaleFactor;
double dynamicHeight = 250 * scaleFactor;
    // Split the time string into two parts
    final timeParts = time.split(' - ');
    final firstTime = timeParts.isNotEmpty ? timeParts[0] : '';
    final secondTime = timeParts.length > 1 ? timeParts[1] : '';
    
    return Container(
      width: dynamicWidth,
      height: dynamicHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          // Title section
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                   fontSize: 20 * scaleFactor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          // Time content section - centered both vertically and horizontally
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First time
                  if (firstTime.isNotEmpty)
                    Text(
                      firstTime,
                      style: TextStyle(
                        fontSize: 20 * scaleFactor,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple
                      ), 
                    ),
                  
                  // "to" in the middle
                  if (firstTime.isNotEmpty && secondTime.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'to',
                        style: TextStyle(
                          fontSize: 16 * scaleFactor,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  
                  // Second time
                  if (secondTime.isNotEmpty)
                    Text(
                      secondTime,
                      style: TextStyle(
                         fontSize: 20 * scaleFactor,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple
                      ), 
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}