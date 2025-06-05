import 'package:astrology/api/api_providers.dart';
import 'package:astrology/global/global_width.dart';
import 'package:astrology/statemanager/date_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

// final astroDataProvider = FutureProvider.autoDispose.family<
//   Map<String, dynamic>,
//   DateTime
// >((ref, selectedDate) async {
//   final formattedDate = selectedDate.toIso8601String().split('.')[0];
//   final coordinates = await ref.watch(coordinatesProvider);
//   final response = await http.get(
//     Uri.parse(
//       'https://api.austrology.synxup.tech/api/kundli?datetime=$formattedDate&coordinates=$coordinates',
//     ),
//   );

//   if (response.statusCode == 200) {
//     return json.decode(response.body)['data']['data'];
//   } else {
//     throw Exception('Failed to load astro data');
//   }
// });

// final calendarDataProvider = FutureProvider.autoDispose
//     .family<Map<String, dynamic>, DateTime>((ref, selectedDate) async {
//       final formattedDate = selectedDate.toIso8601String().split('.')[0];
//       final response = await http.get(
//         Uri.parse(
//           'https://api.austrology.synxup.tech/calendar?datetime=$formattedDate',
//         ),
//       );

//       if (response.statusCode == 200) {
//         return json.decode(response.body)['data']['calendar_date'];
//       } else {
//         throw Exception('Failed to load calendar data');
//       }
//     });

// class DailyAstrocard extends ConsumerWidget {
//   const DailyAstrocard({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedDate = ref.watch(selectedDateProvider);
//     final astroDataAsync = ref.watch(astroDataProvider(selectedDate));
//     final calendarDataAsync = ref.watch(calendarDataProvider(selectedDate));
//     //  final selectedMonth = ref.read(selectedDateProvider);
//      final monthName = DateFormat('MMMM').format(selectedDate);

//     return astroDataAsync.when(
//       loading: () => _buildLoadingState(),
//       error:
//           (error, stack) => _buildErrorState(
//             context,
//             'Unable to load astrological data',
//             () => ref.refresh(astroDataProvider(selectedDate)),
//           ),
//       data: (astroData) {
//         return calendarDataAsync.when(
//           loading: () => _buildLoadingState(),
//           error:
//               (error, stack) => _buildErrorState(
//                 context,
//                 'Unable to load calendar data',
//                 () => ref.refresh(calendarDataProvider(selectedDate)),
//               ),
//           data: (calendarData) {
//             return _buildSuccessState(astroData, calendarData, monthName);
//           },
//         );
//       },
//     );
//   }

//   Widget _buildLoadingState() {
//     return Container(
//       width:  680,
//       height: 300,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.yellow.shade100,
//       ),
//       child: const Center(
//         child: CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
//         ),
//       ),
//     );
//   }

//   Widget _buildErrorState(
//     BuildContext context,
//     String message,
//     VoidCallback onRetry,
//   ) {
//     return Container(
//       width: 680,
//       height:  300,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.yellow.shade100,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.cloud_off, size: 60, color: Colors.amber.shade700),
//           const SizedBox(height: 20),
//           Text(
//             message,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.amber.shade900,
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton.icon(
//             onPressed: onRetry,
//             icon: const Icon(Icons.refresh),
//             label: const Text('Retry'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.amber,
//               foregroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSuccessState(
//     Map<String, dynamic> astroData,
//     Map<String, dynamic> calendarData,
//     String monthName,
//   ) {
    
//     final currentNakshatra = astroData['nakshatra'][0];
//     final currentTithi = astroData['tithi'][0];
//     final sunrise = _formatTime(astroData['sunrise']);
//     final sunset = _formatTime(astroData['sunset']);
//     final date = _formatDate(astroData['sunrise']);

     
  
//     return Container(
//       width:  680,
//       height: 300,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.yellow,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildInfoRow('assets/white_sun.png', sunrise),
//                 _buildInfoRow('assets/blue_sun.png', sunset),
//                 _buildInfoRow(
//                   'assets/calender.png',
//                   '${currentTithi['paksha']} ${currentTithi['name']} till\n${_formatTime(currentTithi['end'])}',
//                   crossStart: true,
//                 ),
//                 _buildInfoRow(
//                   'assets/white_star.png',
//                   '${currentNakshatra['name']} till\n${_formatTime(currentNakshatra['end'])}\nLord: ${currentNakshatra['lord']['vedic_name']}',
//                   crossStart: true,
//                 ),
//               ],
//             ),
//              SizedBox(width:  60,),
//             const VerticalDivider(width: 20, thickness: 2, color: Colors.black),
//              SizedBox(width: 60,),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                    Text(
//                    monthName,
//                   style:  TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   astroData['vaara'],
//                   style:  TextStyle(
//                     fontSize:  25,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   date,
//                   style:  TextStyle(
//                     fontSize:  30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   'Year - ${calendarData['year_name']}',
//                   style:  TextStyle(
//                     fontSize:20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Month - ${calendarData['month_name']}',
//                   style:  TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoRow(
//     String imagePath,
//     String text, {
//     bool crossStart = false,
//   }) {
//     return Row(
//       crossAxisAlignment:
//           crossStart ? CrossAxisAlignment.start : CrossAxisAlignment.center,
//       children: [
//         Image.asset(
//           imagePath,
//           width: 50, // Adjust size as needed
//           height: 50,
//         ),
//         const SizedBox(width: 10),
//         Text(
//           text,
//           style:  TextStyle(fontSize:  15, fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }

//   String _formatTime(String isoTime) {
//     try {
//       final dateTime = DateTime.parse(isoTime).toLocal();
//       return '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}${dateTime.hour >= 12 ? 'PM' : 'AM'}';
//     } catch (e) {
//       return isoTime;
//     }
//   }

//   String _formatDate(String isoTime) {
//     try {
//       final dateTime = DateTime.parse(isoTime).toLocal();
//       return '${dateTime.day}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}';
//     } catch (e) {
//       return isoTime;
//     }
//   }
// }




final astroDataProvider = FutureProvider.autoDispose.family<
    Map<String, dynamic>,
    DateTime
>((ref, selectedDate) async {
  final formattedDate = selectedDate.toIso8601String().split('.')[0];
  final coordinates = await ref.watch(coordinatesProvider);
  final response = await http.get(
    Uri.parse(
      'https://api.austrology.synxup.tech/api/kundli?datetime=$formattedDate&coordinates=$coordinates',
    ),
  );

  if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
  print('Full response: ${response.body}'); // Print raw JSON
  print('Decoded data: ${decodedResponse['data']['data']}'); // Print specific data
  return decodedResponse['data']['data'];
    
    // return json.decode(response.body)['data']['data'];
  } else {
    throw Exception('Failed to load astro data');
  }
});

final calendarDataProvider = FutureProvider.autoDispose
    .family<Map<String, dynamic>, DateTime>((ref, selectedDate) async {
  final formattedDate = selectedDate.toIso8601String().split('.')[0];
  final response = await http.get(
    Uri.parse(
      'https://api.austrology.synxup.tech/calendar?datetime=$formattedDate',
    ),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body)['data']['calendar_date'];
  } else {
    throw Exception('Failed to load calendar data');
  }
});

class DailyAstrocard extends ConsumerWidget {
  const DailyAstrocard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final astroDataAsync = ref.watch(astroDataProvider(selectedDate));
    final calendarDataAsync = ref.watch(calendarDataProvider(selectedDate));
    final monthName = DateFormat('MMMM').format(selectedDate);

    return astroDataAsync.when(
      loading: () => _buildLoadingState(),
      error:
          (error, stack) => _buildErrorState(
            context,
            'Unable to load astrological data',
            () => ref.refresh(astroDataProvider(selectedDate)),
          ),
      data: (astroData) {
        return calendarDataAsync.when(
          loading: () => _buildLoadingState(),
          error:
              (error, stack) => _buildErrorState(
                context,
                'Unable to load calendar data',
                () => ref.refresh(calendarDataProvider(selectedDate)),
              ),
          data: (calendarData) {
            return _buildSuccessState(astroData, calendarData, monthName);
          },
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return Container(
      width:  680,
      height:  ScreenSize.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellow.shade100,
      ),
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
        ),
      ),
    );
  }

  Widget _buildErrorState(
    BuildContext context,
    String message,
    VoidCallback onRetry,
  ) {
    return Container(
      width: 680,
      height:  ScreenSize.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellow.shade100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud_off, size: 60, color: Colors.amber.shade700),
          const SizedBox(height: 20),
          Text(
            message,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.amber.shade900,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState(
    Map<String, dynamic> astroData,
    Map<String, dynamic> calendarData,
    String monthName,
  ) {
    final currentNakshatra = astroData['nakshatra'][0];
    final currentTithi = astroData['tithi'][0];
    final sunrise = _formatTime(astroData['sunrise']);
    final sunset = _formatTime(astroData['sunset']);
    final date = _formatDate(astroData['sunrise']);

    return Container(
      width: 680,
      height: ScreenSize.height * 0.41,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.yellow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildInfoRow('assets/white_sun.png', sunrise),
                    _buildInfoRow('assets/blue_sun.png', sunset),
                    _buildInfoRow(
                      'assets/calender.png',
                      '${currentTithi['paksha']} ${currentTithi['name']} till\n${_formatTime(currentTithi['end'])}',
                      crossStart: true,
                    ),
                    _buildInfoRow(
                      'assets/white_star.png',
                      '${currentNakshatra['name']} till\n${_formatTime(currentNakshatra['end'])}\nLord: ${currentNakshatra['lord']['vedic_name']}',
                      crossStart: true,
                    ),
                  ],
                ),
              ),
            ),
            // Center the VerticalDivider exactly in the middle
            Container(
              height: double.infinity,
              width: 1, // Set the width of the divider
              color: Colors.black,
            ),
            SizedBox(width: 20,),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      monthName,
                      style:  TextStyle(
                        fontSize: ScreenSize.height * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      astroData['vaara'],
                      style:  TextStyle(
                        fontSize: ScreenSize.height * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      date,
                      style:  TextStyle(
                        fontSize: ScreenSize.height * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Year - ${calendarData['year_name']}',
                      style:  TextStyle(
                        fontSize: ScreenSize.height * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Month - ${calendarData['month_name']}',
                      style:  TextStyle(
                        fontSize: ScreenSize.height * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    String imagePath,
    String text, {
    bool crossStart = false,
  }) {
    return Row(
      crossAxisAlignment:
          crossStart ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 50, // Adjust size as needed
          height: 50,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style:  TextStyle(fontSize: ScreenSize.height * 0.02, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String _formatTime(String isoTime) {
    try {
      final dateTime = DateTime.parse(isoTime).toLocal();
      return '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}${dateTime.hour >= 12 ? 'PM' : 'AM'}';
    } catch (e) {
      return isoTime;
    }
  }

  String _formatDate(String isoTime) {
    try {
      final dateTime = DateTime.parse(isoTime).toLocal();
      return '${dateTime.day}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}';
    } catch (e) {
      return isoTime;
    }
  }
}
