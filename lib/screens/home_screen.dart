import 'package:astrology/api/api_providers.dart';
import 'package:astrology/global/global_width.dart';
import 'package:astrology/statemanager/image_change.dart';
import 'package:astrology/widgets/bottom_box.dart';
import 'package:astrology/widgets/buttons/consultastroleger_button.dart';
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
  final Map<String, Color> periodColors = {
    'Rahu': Colors.pink,
    'Yamaganda': Colors.red,
    'Gulika': Colors.orange,
    'Dur Muhurat': Colors.blue,
    'Varjyam': Colors.deepPurple,
  };

  String _formatTime(String isoTime) {
    try {
      final dateTime = DateTime.parse(isoTime).toLocal();
      return DateFormat('hh:mm a').format(dateTime);
    } catch (e) {
      return 'N/A';
    }
  }

  String _getTimeRange(List<dynamic> periods) {
    if (periods.isEmpty) return 'N/A';
    final firstPeriod = periods.first;
    return '${_formatTime(firstPeriod['start'])} - ${_formatTime(firstPeriod['end'])}';
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    final currentImage = ref.watch(imageProvider);
    final inauspiciousPeriodsAsync = ref.watch(inauspiciousPeriodsProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            const LeftBar(),
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
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const HoroscopeButton(),
                                Expanded(
                                  child: Center(
                                    child: ClockWidget(),
                                  ),
                                ),
                                ConsultastrolegerButton(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,  // Giving it more space to expand
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: DailyAstrocard(),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                flex: 1,  // Less space for the image container
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.40, // Adjusted width
                                    height: ScreenSize.height * 0.41,
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
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          inauspiciousPeriodsAsync.when(
                            loading: () => const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: CircularProgressIndicator(),
                            ),
                            error: (error, stack) => Column(
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
                                  onPressed: () => ref.refresh(inauspiciousPeriodsProvider),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: periods.map((period) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: BottomBox(
                                        color: periodColors[period['name']] ?? Colors.grey,
                                        title: period['name'],
                                        time: _getTimeRange(period['period']),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 80,),
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
            const RigthBar(),
          ],
        ),
      ),
    );
  }
}
