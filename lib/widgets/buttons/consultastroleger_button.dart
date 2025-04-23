import 'package:astrology/global/global_width.dart';
import 'package:astrology/widgets/astrologerconsultation_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// class ConsultastrolegerButton extends StatefulWidget {
//   const ConsultastrolegerButton({super.key});

//   @override
//   State<ConsultastrolegerButton> createState() =>
//       _ConsultastrolegerButtonState();
// }

// class _ConsultastrolegerButtonState extends State<ConsultastrolegerButton> {
//   // Function to make a phone call
//   Future<void> _makePhoneCall(String phoneNumber) async {
//     final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);

//     try {
//       await launchUrl(launchUri);
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text('Could not launch dialer: $e')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (context) {
//             return Dialog(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 height: 400,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white,
//                   border: Border.all(color: const Color(0xFFFF9933), width: 2),
//                 ),
//                 child: Column(
//                   children: [
//                     // Top decoration bar with Om symbol
//                     Container(
//                       height: 50,
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [Color(0xFFFF9933), Color(0xFFFF5733)],
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                         ),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(13),
//                           topRight: Radius.circular(13),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             'ॐ',
//                             style: TextStyle(
//                               fontSize: 24,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           const Text(
//                             'Divine Astrology Consultation',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           IconButton(
//                             icon: const Icon(Icons.close, color: Colors.white),
//                             onPressed: () => Navigator.pop(context),
//                             iconSize: 20,
//                             padding: EdgeInsets.zero,
//                             constraints: const BoxConstraints(),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(15),
//                       child: Column(
//                         children: [
//                           // Astrologer image with border decoration
//                           Container(
//                             height: 150,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(
//                                 color: const Color(0xFF800080),
//                                 width: 1,
//                               ),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 // Image takes 40% of the container
//                                 Container(
//                                   width: 150,
//                                   height: 150,

//                                   decoration: const BoxDecoration(
//                                     shape: BoxShape.circle,

//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                         'assets/sohan_samay.png',
//                                       ),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 // Text takes 60% of the container
//                                 Container(
//                                   padding: const EdgeInsets.all(10),
//                                   color: const Color(0xFFFFFAF0),
//                                   child: const Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         'Consult Our Vedic Experts',
//                                         style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                           color: Color(0xFF800080),
//                                         ),
//                                       ),
//                                       SizedBox(height: 5),
//                                       Text(
//                                         'Get guidance on career, relationships, finance & more',
//                                         style: TextStyle(
//                                           fontSize: 12,
//                                           color: Colors.black87,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 15),
//                           // Phone number container - make this clickable too
//                           GestureDetector(
//                             onTap: () => _makePhoneCall('7994748509'),
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: 8,
//                                 horizontal: 15,
//                               ),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFFF0E6FF),
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(
//                                   color: const Color(0xFF800080),
//                                   width: 1,
//                                 ),
//                               ),
//                               child: const Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.call,
//                                     color: Color(0xFF800080),
//                                     size: 20,
//                                   ),
//                                   SizedBox(width: 8),
//                                   Text(
//                                     '7994748509',
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFF800080),
//                                       letterSpacing: 1,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 15),
//                           // Call me button
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                               _makePhoneCall('+91 8590740343');
//                             },
//                             child: Container(
//                               width: double.infinity,
//                               height: 45,
//                               decoration: BoxDecoration(
//                                 gradient: const LinearGradient(
//                                   colors: [
//                                     Color(0xFF800080),
//                                     Color(0xFF9932CC),
//                                   ],
//                                   begin: Alignment.centerLeft,
//                                   end: Alignment.centerRight,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: const Color(0xFF800080),
//                                     spreadRadius: 1,
//                                     blurRadius: 3,
//                                     offset: const Offset(0, 2),
//                                   ),
//                                 ],
//                               ),
//                               child: const Center(
//                                 child: Text(
//                                   'Call Now for Guidance',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },

//       child: Container(
//         width: isWideScreen ? 320 : 280,
//         height: isWideScreen ? 80 : 60,
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 87, 7, 225),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 5, right: 5),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,

//             children: [
//               Image.asset('assets/Horoscope_icon.png'),
//               SizedBox(width: 15),
//               Expanded(
//                 child: const Text(
//                   'Talk to an\nAstrologer',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


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
        width: isWideScreen ? 320 : 280,
        height: isWideScreen ? 80 : 60,
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
                    fontSize: 20,
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