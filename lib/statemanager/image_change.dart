import 'package:flutter_riverpod/flutter_riverpod.dart';

// Holds the image path
final imageProvider = StateProvider<String>((ref) {
  return 'assets/ganpathi.jpg'; // Default image
});
