import 'package:astrology/global/global_width.dart';
import 'package:astrology/statemanager/date_time.dart';
import 'package:astrology/statemanager/image_change.dart';
import 'package:astrology/widgets/buttons/leftcalender_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class LeftBar extends ConsumerStatefulWidget {
  const LeftBar({super.key});

  @override
  ConsumerState<LeftBar> createState() => _LeftBarState();
}

class _LeftBarState extends ConsumerState<LeftBar> {
  List<Widget> calendarButtons = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    generateCalendar(DateTime.now());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateImageForDate(DateTime.now());
    });
  }

  void generateCalendar(DateTime forDate) {
    final now = DateTime.now();
    final selectedDate = ref.read(selectedDateProvider);

    final imageMap = {
      'Monday': 'assets/shiva.jpg',
      'Tuesday': 'assets/hanuman.jpg',
      'Wednesday': 'assets/ganesh.jpg',
      'Thursday': 'assets/saibaba.jpg',
      'Friday': 'assets/laxmidevi.jpg',
      'Saturday': 'assets/venkateshwara.jpg',
      'Sunday': 'assets/suryabhagavan.jpg',
    };

    int totalDays = DateUtils.getDaysInMonth(forDate.year, forDate.month);

    calendarButtons = List.generate(totalDays, (index) {
      final day = index + 1;
      final currentDate = DateTime(forDate.year, forDate.month, day);
      final dayName = DateFormat('EEEE').format(currentDate);
      final imagePath = imageMap[dayName]!;

      final isToday = currentDate.year == now.year &&
          currentDate.month == now.month &&
          currentDate.day == now.day;

      final isSelected = currentDate.year == selectedDate.year &&
          currentDate.month == selectedDate.month &&
          currentDate.day == selectedDate.day;

      return LeftcalenderButton(
        date: '$day',
        isToday: isToday,
        isSelected: isSelected,
        onTap: () {
          ref.read(selectedDateProvider.notifier).state = currentDate;
          ref.read(imageProvider.notifier).state = imagePath;
          generateCalendar(forDate);
          _scrollToDay(day);
        },
      );
    });
  }

  void _updateImageForDate(DateTime date) {
    final dayName = DateFormat('EEEE').format(date);
    final imageMap = {
      'Monday': 'assets/shiva.jpg',
      'Tuesday': 'assets/hanuman.jpg',
      'Wednesday': 'assets/ganesh.jpg',
      'Thursday': 'assets/saibaba.jpg',
      'Friday': 'assets/laxmidevi.jpg',
      'Saturday': 'assets/venkateshwara.jpg',
      'Sunday': 'assets/surya_bhagwan.jpg',
    };
    ref.read(imageProvider.notifier).state = imageMap[dayName]!;
  }

  void _scrollToDay(int day) {
    final offset = (day - 1) * 50.0;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> openDatePicker() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 2),
    );

    if (picked != null) {
      ref.read(selectedDateProvider.notifier).state = picked;
      _updateImageForDate(picked);
      generateCalendar(picked);
      _scrollToDay(picked.day);
    }
  }

  Widget buildHeader(DateTime date) {
    final day = date.day.toString();
    final month = DateFormat('MMMM').format(date);

    return GestureDetector(
      onTap: openDatePicker,
      child: Container(
        width: 80,
        height: 100,
        color: const Color.fromARGB(255, 179, 5, 195),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day, 
                style: const TextStyle(
                    fontSize: 28, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.white)),
            Text(month, 
                style: const TextStyle(
                    fontSize: 12, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget buildCalendarList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: 80,
          color: Colors.black,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: calendarButtons
                  .map((button) => Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: button,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTodayButton() {
    return GestureDetector(
      onTap: () {
        final today = DateTime.now();
        ref.read(selectedDateProvider.notifier).state = today;
        _updateImageForDate(today);
        generateCalendar(today);
        _scrollToDay(today.day);
      },
      child: Container(
        width: 80,
        height: 100,
        color: const Color.fromARGB(255, 179, 5, 195),
        child: const Center(
          child: Text(
            'TODAY',
            style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold, 
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(selectedDateProvider);

    return Container(
      width: 80,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Column(
        children: [
          buildHeader(selectedDate),
          buildCalendarList(),
          buildTodayButton(),
        ],
      ),
    );
  }
}