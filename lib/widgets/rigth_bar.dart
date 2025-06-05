// import 'package:astrology/global/global_width.dart';
// import 'package:astrology/widgets/buttons/rightcalender_button.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class RigthBar extends StatelessWidget {
//   const RigthBar({super.key});

//   // Function to fetch horoscope data
//   Future<Map<String, dynamic>> fetchHoroscope(String sign) async {
//     final date = DateTime.now().toString().split(' ')[0]; // Get current date in YYYY-MM-DD format
//     final url = Uri.parse('https://api.austrology.synxup.tech/daily-horoscope?datetime=$date&sign=$sign&type=general');
    
//     try {
//       final response = await http.get(url);
    
//       if (response.statusCode == 200) {
//           print('respondssss${response.body}');
//         return json.decode(response.body);
//       } else {
//         throw Exception('Failed to load horoscope');
//       }
//     } catch (e) {
//       throw Exception('Failed to fetch data: $e');
//     }
//   }

//   // Get zodiac symbol (unicode character)
//   String getZodiacSymbol(String sign) {
//     final Map<String, String> symbols = {
//       'aries': '♈',
//       'taurus': '♉',
//       'gemini': '♊',
//       'cancer': '♋',
//       'leo': '♌',
//       'virgo': '♍',
//       'libra': '♎',
//       'scorpio': '♏',
//       'sagittarius': '♐',
//       'capricorn': '♑',
//       'aquarius': '♒',
//       'pisces': '♓',
//     };
//     return symbols[sign] ?? '';
//   }

//   // Get element for zodiac sign
//   String getZodiacElement(String sign) {
//     final Map<String, String> elements = {
//       'aries': 'Fire',
//       'leo': 'Fire',
//       'sagittarius': 'Fire',
//       'taurus': 'Earth',
//       'virgo': 'Earth',
//       'capricorn': 'Earth',
//       'gemini': 'Air',
//       'libra': 'Air',
//       'aquarius': 'Air',
//       'cancer': 'Water',
//       'scorpio': 'Water',
//       'pisces': 'Water',
//     };
//     return elements[sign] ?? '';
//   }

//   // Get color for zodiac element
//   Color getElementColor(String element) {
//     final Map<String, Color> colors = {
//       'Fire': Colors.orange.shade700,
//       'Earth': Colors.brown.shade600,
//       'Air': Colors.lightBlue.shade400,
//       'Water': Colors.blue.shade700,
//     };
//     return colors[element] ?? Colors.purple;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Map image indices to zodiac signs
//     final zodiacSigns = [
//       'aries', 'taurus', 'gemini', 'cancer', 
//       'leo', 'virgo', 'libra', 'scorpio', 
//       'sagittarius', 'capricorn', 'aquarius', 'pisces'
//     ];

//     List<String> imagePaths = List.generate(
//       12,
//       (index) => 'assets/icons/image-${index + 1}.png',
//     );

//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: isWideScreen?120: 80,
//       color: Colors.black,
//       child: Column(
//         children: [
//           Container(
//             width: isWideScreen?120: 80,
//             height: isWideScreen?140: 120,
//             color: const Color.fromARGB(255, 179, 5, 195),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '2025',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   'Rashi\nPhala',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Wrap(
//                     spacing: 10,
//                     runSpacing: 10,
//                     children: List.generate(imagePaths.length, (index) {
//                       return RightcalenderButton(
//                         imagePath: imagePaths[index],
//                         onTap: () async {
//                           final sign = zodiacSigns[index];
//                           try {
//                             // Show loading dialog
//                             showDialog(
//                               context: context,
//                               barrierDismissible: false,
//                               builder: (context) => Dialog(
//                                 backgroundColor: Colors.transparent,
//                                 elevation: 0,
//                                 child: Container(
//                                   padding: EdgeInsets.all(20),
//                                   decoration: BoxDecoration(
//                                     color: Colors.white.withOpacity(0.9),
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       SizedBox(
//                                         width: 60,
//                                         height: 60,
//                                         child: CircularProgressIndicator(
//                                           valueColor: AlwaysStoppedAnimation<Color>(
//                                             Color.fromARGB(255, 179, 5, 195),
//                                           ),
//                                           strokeWidth: 4,
//                                         ),
//                                       ),
//                                       SizedBox(height: 20),
//                                       Text(
//                                         'Reading the stars for ${sign[0].toUpperCase()}${sign.substring(1)}...',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );

//                             // Fetch data
//                             final horoscopeData = await fetchHoroscope(sign);
                            
//                             // Close loading dialog
//                             Navigator.of(context).pop();
                            
//                             // Get date
//                             final now = DateTime.now();
//                             final String formattedDate = "${now.day} ${_getMonth(now.month)}, ${now.year}";
                            
//                             // Get element
//                             final String element = getZodiacElement(sign);
//                             final Color elementColor = getElementColor(element);
                            
//                             // Show results dialog
//                             showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return Dialog(
//                                   backgroundColor: Colors.transparent,
//                                   insetPadding: EdgeInsets.symmetric(horizontal: 20),
//                                   child: Container(
//                                     width: 550,
//                                     constraints: BoxConstraints(maxHeight: 600),
//                                     decoration: BoxDecoration(
//                                       gradient: LinearGradient(
//                                         begin: Alignment.topLeft,
//                                         end: Alignment.bottomRight,
//                                         colors: [
//                                           Colors.indigo.shade900,
//                                           Colors.purple.shade900,
//                                         ],
//                                       ),
//                                       borderRadius: BorderRadius.circular(20),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.black.withOpacity(0.3),
//                                           spreadRadius: 5,
//                                           blurRadius: 15,
//                                           offset: Offset(0, 5),
//                                         ),
//                                       ],
//                                     ),
//                                     child: Stack(
//                                       children: [
//                                         // Background cosmic elements
//                                         Positioned.fill(
//                                           child: ClipRRect(
//                                             borderRadius: BorderRadius.circular(20),
//                                             child: Opacity(
//                                               opacity: 0.15,
//                                               child: Image.asset(
//                                                 'assets/icons/cosmos_bg.png',
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
                                        
//                                         // Content
//                                         Padding(
//                                           padding: const EdgeInsets.all(24.0),
//                                           child: Column(
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               // Header
//                                               Row(
//                                                 children: [
//                                                   Container(
//                                                     width: 70,
//                                                     height: 70,
//                                                     decoration: BoxDecoration(
//                                                       color: elementColor.withOpacity(0.2),
//                                                       shape: BoxShape.circle,
//                                                       border: Border.all(
//                                                         color: elementColor,
//                                                         width: 2,
//                                                       ),
//                                                     ),
//                                                     child: Center(
//                                                       child: Text(
//                                                         getZodiacSymbol(sign),
//                                                         style: TextStyle(
//                                                           fontSize: 40,
//                                                           color: Colors.white,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   SizedBox(width: 16),
//                                                   Expanded(
//                                                     child: Column(
//                                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                                       children: [
//                                                         Text(
//                                                           '${sign[0].toUpperCase()}${sign.substring(1)}',
//                                                           style: TextStyle(
//                                                             fontSize: 28,
//                                                             fontWeight: FontWeight.bold,
//                                                             color: Colors.white,
//                                                             letterSpacing: 1.2,
//                                                           ),
//                                                         ),
//                                                         SizedBox(height: 4),
//                                                         Row(
//                                                           children: [
//                                                             Container(
//                                                               padding: EdgeInsets.symmetric(
//                                                                 horizontal: 10,
//                                                                 vertical: 4,
//                                                               ),
//                                                               decoration: BoxDecoration(
//                                                                 color: elementColor.withOpacity(0.3),
//                                                                 borderRadius: BorderRadius.circular(12),
//                                                                 border: Border.all(
//                                                                   color: elementColor,
//                                                                   width: 1,
//                                                                 ),
//                                                               ),
//                                                               child: Text(
//                                                                 element,
//                                                                 style: TextStyle(
//                                                                   color: Colors.white,
//                                                                   fontWeight: FontWeight.w500,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             SizedBox(width: 10),
//                                                             Text(
//                                                               formattedDate,
//                                                               style: TextStyle(
//                                                                 color: Colors.white.withOpacity(0.8),
//                                                                 fontWeight: FontWeight.w400,
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
                                              
//                                               SizedBox(height: 24),
                                              
//                                               // Divider
//                                               Container(
//                                                 height: 1,
//                                                 width: double.infinity,
//                                                 decoration: BoxDecoration(
//                                                   gradient: LinearGradient(
//                                                     colors: [
//                                                       Colors.transparent,
//                                                       Colors.white.withOpacity(0.5),
//                                                       Colors.transparent,
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
                                              
//                                               SizedBox(height: 24),
                                              
//                                               // Prediction content
//                                               Flexible(
//                                                 child: Container(
//                                                   width: double.infinity,
//                                                   padding: EdgeInsets.all(20),
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.white.withOpacity(0.1),
//                                                     borderRadius: BorderRadius.circular(16),
//                                                     border: Border.all(
//                                                       color: Colors.white.withOpacity(0.2),
//                                                       width: 1,
//                                                     ),
//                                                   ),
//                                                   child: SingleChildScrollView(
//                                                     child: Column(
//                                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                                       children: [
//                                                         RichText(
//                                                           text: TextSpan(
//                                                             style: TextStyle(
//                                                               fontSize: 18,
//                                                               height: 1.5,
//                                                               color: Colors.white.withOpacity(0.95),
//                                                             ),
//                                                             children: [
//                                                               TextSpan(
//                                                                 text: "Today's Prediction\n\n",
//                                                                 style: TextStyle(
//                                                                   fontWeight: FontWeight.bold,
//                                                                   fontSize: 20,
//                                                                 ),
//                                                               ),
//                                                               TextSpan(
//                                                                 text: horoscopeData['data'] != null
//                                                                     ? horoscopeData["data"]["data"]["daily_predictions"][0]["predictions"][0]["prediction"] ?? 'No prediction available'
//                                                                     : 'No prediction available',
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
                                              
//                                               SizedBox(height: 24),
                                              
//                                               // Close button
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                 children: [
//                                                   ElevatedButton(
//                                                     onPressed: () => Navigator.of(context).pop(),
//                                                     style: ElevatedButton.styleFrom(
//                                                       backgroundColor: elementColor,
//                                                       foregroundColor: Colors.white,
//                                                       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//                                                       shape: RoundedRectangleBorder(
//                                                         borderRadius: BorderRadius.circular(30),
//                                                       ),
//                                                     ),
//                                                     child: Text(
//                                                       'Close',
//                                                       style: TextStyle(
//                                                         fontSize: 16,
//                                                         fontWeight: FontWeight.bold,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           } catch (e) {
//                             // Close loading dialog if open
//                             Navigator.of(context).pop();
//                             // Show error dialog
//                             showDialog(
//                               context: context,
//                               builder: (context) => Dialog(
//                                 backgroundColor: Colors.transparent,
//                                 child: Container(
//                                   padding: EdgeInsets.all(20),
//                                   decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight,
//                                       colors: [
//                                         Colors.red.shade800,
//                                         Colors.red.shade900,
//                                       ],
//                                     ),
//                                     borderRadius: BorderRadius.circular(16),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.black.withOpacity(0.3),
//                                         spreadRadius: 5,
//                                         blurRadius: 15,
//                                       ),
//                                     ],
//                                   ),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Icon(
//                                         Icons.error_outline,
//                                         color: Colors.white,
//                                         size: 60,
//                                       ),
//                                       SizedBox(height: 16),
//                                       Text(
//                                         'Cosmic Connection Error',
//                                         style: TextStyle(
//                                           fontSize: 22,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       SizedBox(height: 12),
//                                       Text(
//                                         'Unable to connect with the stars at this moment. Please try again later.',
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           color: Colors.white.withOpacity(0.9),
//                                         ),
//                                       ),
//                                       SizedBox(height: 24),
//                                       ElevatedButton(
//                                         onPressed: () => Navigator.of(context).pop(),
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor: Colors.white,
//                                           foregroundColor: Colors.red.shade900,
//                                           padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(30),
//                                           ),
//                                         ),
//                                         child: Text(
//                                           'Close',
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }
//                         },
//                       );
//                     }),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
  
//   // Helper method to get month name from number
//   String _getMonth(int month) {
//     const months = [
//       'January', 'February', 'March', 'April',
//       'May', 'June', 'July', 'August',
//       'September', 'October', 'November', 'December'
//     ];
//     return months[month - 1];
//   }
// }


import 'package:astrology/global/global_width.dart';
import 'package:astrology/statemanager/date_time.dart';
import 'package:astrology/widgets/buttons/rightcalender_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class RigthBar extends ConsumerWidget {
  const RigthBar({super.key});

  // Function to fetch horoscope data
  Future<Map<String, dynamic>> fetchHoroscope(String sign, selectedDate) async {
    final date = DateTime.now().toString().split(' ')[0];
   
    final url = Uri.parse('https://api.austrology.synxup.tech/daily-horoscope?datetime=$date&sign=$sign&type=general');
    try {
      final response = await http.get(url);
    
      if (response.statusCode == 200) {
        print('API Response: ${response.body}');
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load horoscope');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  // Get zodiac symbol (unicode character)
  String getZodiacSymbol(String sign) {
    final Map<String, String> symbols = {
      'aries': '♈',
      'taurus': '♉',
      'gemini': '♊',
      'cancer': '♋',
      'leo': '♌',
      'virgo': '♍',
      'libra': '♎',
      'scorpio': '♏',
      'sagittarius': '♐',
      'capricorn': '♑',
      'aquarius': '♒',
      'pisces': '♓',
    };
    return symbols[sign.toLowerCase()] ?? '';
  }

  // Get element for zodiac sign
  String getZodiacElement(String sign) {
    final Map<String, String> elements = {
      'aries': 'Fire',
      'leo': 'Fire',
      'sagittarius': 'Fire',
      'taurus': 'Earth',
      'virgo': 'Earth',
      'capricorn': 'Earth',
      'gemini': 'Air',
      'libra': 'Air',
      'aquarius': 'Air',
      'cancer': 'Water',
      'scorpio': 'Water',
      'pisces': 'Water',
    };
    return elements[sign.toLowerCase()] ?? '';
  }

  // Get color for zodiac element
  Color getElementColor(String element) {
    final Map<String, Color> colors = {
      'Fire': Colors.orange.shade700,
      'Earth': Colors.brown.shade600,
      'Air': Colors.lightBlue.shade400,
      'Water': Colors.blue.shade700,
    };
    return colors[element] ?? Colors.purple;
  }

  // Helper method to safely extract prediction text
  String getPredictionText(Map<String, dynamic> horoscopeData, String sign) {
    try {
      if (horoscopeData['data'] == null) return 'No prediction available';
      
      final predictions = horoscopeData['data']['predictions'];
      if (predictions == null) return 'No prediction available';
      
      final signData = predictions[sign.toLowerCase()];
      if (signData == null) return 'No prediction available';
      
      final generalData = signData['general'];
      if (generalData == null) return 'No prediction available';
      
      final dailyPredictions = generalData['daily_predictions'];
      if (dailyPredictions == null || dailyPredictions.isEmpty) return 'No prediction available';
      
      final firstPrediction = dailyPredictions[0];
      if (firstPrediction['predictions'] == null || firstPrediction['predictions'].isEmpty) {
        return 'No prediction available';
      }
      
      return firstPrediction['predictions'][0]['prediction'] ?? 'No prediction available';
    } catch (e) {
      print('Error parsing prediction: $e');
      return 'No prediction available';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final zodiacSigns = [
      'aries', 'taurus', 'gemini', 'cancer', 
      'leo', 'virgo', 'libra', 'scorpio', 
      'sagittarius', 'capricorn', 'aquarius', 'pisces'
    ];

    // Updated to use zodiac sign names directly for image paths
    List<String> imagePaths = zodiacSigns.map((sign) => 'assets/icons/$sign.png').toList();

    return Container(
      height: MediaQuery.of(context).size.height,
      width: 80,
      color: Colors.black,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 120,
            color: const Color.fromARGB(255, 179, 5, 195),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${selectedDate.year}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Rashi\nPhala',
                  style: TextStyle(
                    fontSize: 12,
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
                    children: List.generate(imagePaths.length, (index) {
                      final sign = zodiacSigns[index];
                      return RightcalenderButton(
                        imagePath: imagePaths[index],
                        onTap: () async {
                          try {
                            // Show loading dialog
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => Dialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            Color.fromARGB(255, 179, 5, 195),
                                          ),
                                          strokeWidth: 4,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        'Reading the stars for ${sign[0].toUpperCase()}${sign.substring(1)}...',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );

                            // Fetch data
                            final horoscopeData = await fetchHoroscope(sign, selectedDate);
                            
                            // Close loading dialog
                            Navigator.of(context).pop();
                            
                            // Get date
                            final String formattedDate = "${selectedDate.day} ${_getMonth(selectedDate.month)}, ${selectedDate.year}";
                            
                            // Get element
                            final String element = getZodiacElement(sign);
                            final Color elementColor = getElementColor(element);
                            
                            // Show results dialog
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    width: 550,
                                    constraints: BoxConstraints(maxHeight: 600),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.indigo.shade900,
                                          Colors.purple.shade900,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 5,
                                          blurRadius: 15,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        // Background cosmic elements
                                        Positioned.fill(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: Opacity(
                                              opacity: 0.15,
                                              child: Image.asset(
                                                'assets/icons/cosmos_bg.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        
                                        // Content
                                        Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // Header
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 70,
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                      color: elementColor.withOpacity(0.2),
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: elementColor,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        getZodiacSymbol(sign),
                                                        style: TextStyle(
                                                          fontSize: 40,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 16),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          '${sign[0].toUpperCase()}${sign.substring(1)}',
                                                          style: TextStyle(
                                                            fontSize: 28,
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                            letterSpacing: 1.2,
                                                          ),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets.symmetric(
                                                                horizontal: 10,
                                                                vertical: 4,
                                                              ),
                                                              decoration: BoxDecoration(
                                                                color: elementColor.withOpacity(0.3),
                                                                borderRadius: BorderRadius.circular(12),
                                                                border: Border.all(
                                                                  color: elementColor,
                                                                  width: 1,
                                                                ),
                                                              ),
                                                              child: Text(
                                                                element,
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Text(
                                                              formattedDate,
                                                              style: TextStyle(
                                                                color: Colors.white.withOpacity(0.8),
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              
                                              SizedBox(height: 24),
                                              
                                              // Divider
                                              Container(
                                                height: 1,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.transparent,
                                                      Colors.white.withOpacity(0.5),
                                                      Colors.transparent,
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              
                                              SizedBox(height: 24),
                                              
                                              // Prediction content
                                              Flexible(
                                                child: Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white.withOpacity(0.1),
                                                    borderRadius: BorderRadius.circular(16),
                                                    border: Border.all(
                                                      color: Colors.white.withOpacity(0.2),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        RichText(
                                                          text: TextSpan(
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              height: 1.5,
                                                              color: Colors.white.withOpacity(0.95),
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text: "Today's Prediction\n\n",
                                                                style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: getPredictionText(horoscopeData, sign),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              
                                              SizedBox(height: 24),
                                              
                                              // Close button
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () => Navigator.of(context).pop(),
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: elementColor,
                                                      foregroundColor: Colors.white,
                                                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(30),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Close',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } catch (e) {
                            // Close loading dialog if open
                            if (Navigator.of(context).canPop()) {
                              Navigator.of(context).pop();
                            }
                            // Show error dialog
                            showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.red.shade800,
                                        Colors.red.shade900,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 5,
                                        blurRadius: 15,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        color: Colors.white,
                                        size: 60,
                                      ),
                                      SizedBox(height: 16),
                                      Text(
                                        'Cosmic Connection Error',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Text(
                                        'Unable to connect with the stars at this moment. Please try again later.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white.withOpacity(0.9),
                                        ),
                                      ),
                                      SizedBox(height: 24),
                                      ElevatedButton(
                                        onPressed: () => Navigator.of(context).pop(),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.red.shade900,
                                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                        ),
                                        child: Text(
                                          'Close',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  // Helper method to get month name from number
  String _getMonth(int month) {
    const months = [
      'January', 'February', 'March', 'April',
      'May', 'June', 'July', 'August',
      'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}