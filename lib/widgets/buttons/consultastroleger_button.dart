import 'package:astrology/global/global_width.dart';
import 'package:astrology/widgets/astrologerconsultation_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ConsultastrolegerButton extends StatelessWidget {
  const ConsultastrolegerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const AstrologerConsultationDialog(),
        );
      },
      child: Container(
        width:220,
        height:50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 87, 7, 225),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/Horoscope_icon.png'),
              const SizedBox(width: 15),
              const Expanded(
                child: Text(
                  'Talk to an\nAstrologer',
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