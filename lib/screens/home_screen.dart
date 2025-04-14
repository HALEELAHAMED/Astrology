
import 'package:astrology/api/api_providers.dart';
import 'package:astrology/statemanager/image_change.dart';
import 'package:astrology/widgets/bottom_box.dart';
import 'package:astrology/widgets/buttons/horoscope_button.dart';
import 'package:astrology/widgets/clock_widget.dart';
import 'package:astrology/widgets/daily_astrocard.dart';
import 'package:astrology/widgets/left_bar.dart';
import 'package:astrology/widgets/rigth_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // Map of colors for each period type
  final Map<String, Color> periodColors = {
    'Rahu': Colors.pink,
    'Yamaganda': Colors.red,
    'Gulika': Colors.orange,
    'Dur Muhurat': Colors.blue,
    'Varjyam': Colors.deepPurple,
  };

  // Function to parse time from ISO format to a more readable format
  String _formatTime(String isoTime) {
    try {
      final dateTime = DateTime.parse(isoTime).toLocal();
      return DateFormat('hh:mm a').format(dateTime);
    } catch (e) {
      return 'N/A';
    }
  }

  // Function to get the first period's time range
  String _getTimeRange(List<dynamic> periods) {
    if (periods.isEmpty) return 'N/A';
    final firstPeriod = periods.first;
    return '${_formatTime(firstPeriod['start'])} - ${_formatTime(firstPeriod['end'])}';
  }

  @override
  Widget build(BuildContext context) {
    final currentImage = ref.watch(imageProvider);
    final inauspiciousPeriodsAsync = ref.watch(inauspiciousPeriodsProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            // Left Bar
            const LeftBar(),
            // Middle Screen
            Expanded(
              child: Container(
                height: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/bgimage.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(alignment: Alignment.topCenter, child: ClockWidget()),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 20,
                              right: 20,
                            ),
                            child: Row(
                              children: [
                                const HoroscopeButton(),
                                const Spacer(),
                                Container(
                                  width: 280,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      87,
                                      7,
                                      225,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Row(
                                    children: [
                                      SizedBox(width: 20),
                                      Icon(Icons.circle, color: Colors.white),
                                      SizedBox(width: 40),
                                      Text(
                                        'Talk to an\nAstrologer',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: DailyAstrocard(),
                              ),
                              const SizedBox(width: 20),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  width: 390,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      currentImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Handle the async data
                          inauspiciousPeriodsAsync.when(
                            loading:
                                () => const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: CircularProgressIndicator(),
                                ),
                            error:
                                (error, stack) => Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        'Error: $error',
                                        style: const TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed:
                                          () => ref.refresh(
                                            inauspiciousPeriodsProvider,
                                          ),
                                      child: const Text('Retry'),
                                    ),
                                  ],
                                ),
                            data: (periods) {
                              if (periods.isEmpty) {
                                return const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text('No inauspicious periods today'),
                                );
                              }
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children:
                                      periods.map((period) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: BottomBox(
                                            color:
                                                periodColors[period['name']] ??
                                                Colors.grey,
                                            title: period['name'],
                                            time: _getTimeRange(
                                              period['period'],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Right side bar
            const RigthBar(),
          ],
        ),
      ),
    );
  }
}
