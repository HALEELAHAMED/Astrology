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
    return Container(
      width: 200,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            )
          ),
            SizedBox(height: 70,),
          Center(child: Text(time)),
        ],
      ),
    );
  }
}
