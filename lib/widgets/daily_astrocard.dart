import 'package:flutter/material.dart';

class DailyAstrocard extends StatelessWidget {
  const DailyAstrocard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 680,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.tab, size: 30),
                    SizedBox(width: 10),
                    Text(
                      '6.52Am',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Icon(Icons.tab, size: 30),
                    SizedBox(width: 10),
                    Text(
                      '6.52Am',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.tab, size: 30),
                    SizedBox(width: 10),
                    Text(
                      'Krishna Paksha \nThrayodasi till\n 08:35Pm next\n Chaturdasi',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.tab, size: 30),
                    SizedBox(width: 10),
                    Text(
                      'Moola till \n09:02AM next\n 08:35Pm next\nPurvaAhgadha',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 100),
            VerticalDivider(
              width: 20, // space between the widgets
              thickness: 2, // line thickness
              color: Colors.black,
            ),
            SizedBox(width: 80),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'January',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                Text(
                  'Monday',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                Text(
                  '27-01-2025',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),

                Text(
                  'Year-Sri Krodhi,',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                Text(
                  'Month - Pushyamu',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
