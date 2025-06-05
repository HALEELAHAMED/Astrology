import 'package:astrology/global/global_width.dart';
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
        width: 220,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/Horoscope_icon.png'),
              SizedBox(width: 15,),
               Expanded(
                 child: Text(
                  'Your horoscope\n      for today',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                               ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
