// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// final locationProvider = FutureProvider.autoDispose<Position>((ref) async {
//   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     throw Exception('Location services are disabled.');
//   }

//   LocationPermission permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       throw Exception('Location permissions are denied');
//     }
//   }
  
//   if (permission == LocationPermission.deniedForever) {
//     throw Exception('Location permissions are permanently denied');
//   }

//   return await Geolocator.getCurrentPosition();
// });

// final inauspiciousPeriodsProvider = FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
//   final now = DateTime.now().toUtc().toIso8601String();
//   final location = await ref.watch(locationProvider.future);
//   final coordinates = '${location.latitude},${location.longitude}';

//   print('Status: ${now}');

  
//   final response = await http.get(
//     Uri.parse('https://api.austrology.synxup.tech/inauspicious-period?datetime=$now&coordinates=$coordinates'),
//   );
// print('=== API Response ===');
// print('Status: ${response.statusCode}');
// print('Headers: ${response.headers}');
// print('Body: ${response.body}');
//   if (response.statusCode == 200) {
//     final Map<String, dynamic> responseData = json.decode(response.body);
    
//     // Extract the list from the 'data' field
//     if (responseData.containsKey('data') && responseData['data'] is List) {
//       return List<Map<String, dynamic>>.from(responseData['data']);
//     } else {
//       throw Exception('Invalid API response format - missing data array');
//     }
//   } else {
//     throw Exception('Failed to load inauspicious periods: ${response.statusCode}');
//   }
// });


import 'package:astrology/statemanager/date_time.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

final locationProvider = FutureProvider.autoDispose<Position>((ref) async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.');
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception('Location permissions are permanently denied');
  }

  return await Geolocator.getCurrentPosition();
});

final inauspiciousPeriodsProvider = FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
  final selectedDate = ref.watch(selectedDateProvider); // 👈 Watch the selected date

  // Use selected date instead of DateTime.now()
  final selectedUtcDate = selectedDate.toUtc().toIso8601String();

  final location = await ref.watch(locationProvider.future);
  final coordinates = '${location.latitude},${location.longitude}';

  final response = await http.get(
    Uri.parse('https://api.austrology.synxup.tech/inauspicious-period?datetime=$selectedUtcDate&coordinates=$coordinates'),
  );

  print('=== API Response ===');
  print('Status: ${response.statusCode}');
  print('Headers: ${response.headers}');
  print('Body: ${response.body}');

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (responseData.containsKey('data') && responseData['data'] is List) {
      return List<Map<String, dynamic>>.from(responseData['data']);
    } else {
      throw Exception('Invalid API response format - missing data array');
    }
  } else {
    throw Exception('Failed to load inauspicious periods: ${response.statusCode}');
  }
});






