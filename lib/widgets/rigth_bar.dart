import 'package:astrology/widgets/buttons/rightcalender_button.dart';
import 'package:flutter/material.dart';

class RigthBar extends StatelessWidget {
  const RigthBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = List.generate(
      12,
      (index) => 'assets/icons/image-${index + 1}.png',
    );

    return Container(
      height: MediaQuery.of(context).size.height,
      width: 80,
      color: Colors.black,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 100,
            color: const Color.fromARGB(255, 179, 5, 195),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '2025',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Rashi\nPhala',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                        imagePaths.map((path) {
                          return RightcalenderButton(
                            imagePath: path,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: SizedBox(
                                      width: 500,
                                      height: 500,
                                      child: Center(child: Text('Hello')),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        }).toList(),
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
