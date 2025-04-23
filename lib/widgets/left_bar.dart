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
  }

  void generateCalendar(DateTime forDate) {
    final now = DateTime.now();
    final selectedDate = ref.read(selectedDateProvider);

    int totalDays = DateUtils.getDaysInMonth(forDate.year, forDate.month);

    calendarButtons = List.generate(totalDays, (index) {
      final day = index + 1;
      final currentDate = DateTime(forDate.year, forDate.month, day);

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
          ref.read(imageProvider.notifier).state = 'assets/image-$day.jpg';
          generateCalendar(forDate);
          _scrollToDay(day);
        },
      );
    });
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
      firstDate: DateTime(now.year-1),
      lastDate: DateTime(now.year + 2),
    );

    if (picked != null) {
      ref.read(selectedDateProvider.notifier).state = picked;
      ref.read(imageProvider.notifier).state = 'assets/image-${picked.day}.jpg';
      generateCalendar(picked);
      _scrollToDay(picked.day);
    }
  }

  Widget buildHeader(DateTime date) {
    final day = date.day.toString();
    final month = DateFormat.MMMM().format(date);

    return GestureDetector(
      onTap: openDatePicker,
      child: Container(
        width: isWideScreen?120: 80,
        height: isWideScreen?140: 100,
        color: const Color.fromARGB(255, 179, 5, 195),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
            Text(month, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
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
          width: isWideScreen?120: 80,
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
        ref.read(imageProvider.notifier).state = 'assets/image-${today.day}.jpg';
        generateCalendar(today);
        _scrollToDay(today.day);
      },
      child: Container(
        width: isWideScreen?120: 80,
        height: isWideScreen?140: 100,
        color: const Color.fromARGB(255, 179, 5, 195),
        child: const Center(
          child: Text(
            'TODAY',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(selectedDateProvider);

    return Container(
      width: isWideScreen?120: 80,
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


// import 'package:astrology/statemanager/date_time.dart';
// import 'package:astrology/statemanager/image_change.dart';
// import 'package:astrology/widgets/buttons/leftcalender_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';

// class LeftBar extends ConsumerStatefulWidget {
//   const LeftBar({super.key});

//   @override
//   ConsumerState<LeftBar> createState() => _LeftBarState();
// }

// class _LeftBarState extends ConsumerState<LeftBar> {
//   List<Widget> calendarButtons = [];
//   final ScrollController _scrollController = ScrollController();
//   double _baseWidth = 80.0; // Base width for 10.1-inch tablet
//   double _scaleFactor = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     _determineScaleFactor();
//     generateCalendar(DateTime.now());
//   }

//   void _determineScaleFactor() {
//     final mediaQuery = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
//     final shortestSide = mediaQuery.size.shortestSide;
    
//     // For 15-inch tablets (typically have shortestSide > 600)
//     if (shortestSide > 600) {
//       _scaleFactor = 1.5;
//     } else {
//       // For 10.1-inch tablets
//       _scaleFactor = 1.0;
//     }
//   }

//   void generateCalendar(DateTime forDate) {
//     final now = DateTime.now();
//     final selectedDate = ref.read(selectedDateProvider);

//     int totalDays = DateUtils.getDaysInMonth(forDate.year, forDate.month);

//     calendarButtons = List.generate(totalDays, (index) {
//       final day = index + 1;
//       final currentDate = DateTime(forDate.year, forDate.month, day);

//       final isToday = currentDate.year == now.year &&
//           currentDate.month == now.month &&
//           currentDate.day == now.day;

//       final isSelected = currentDate.year == selectedDate.year &&
//           currentDate.month == selectedDate.month &&
//           currentDate.day == selectedDate.day;

//       return LeftcalenderButton(
//         date: '$day',
//         isToday: isToday,
//         isSelected: isSelected,
//         scaleFactor: _scaleFactor,
//         onTap: () {
//           ref.read(selectedDateProvider.notifier).state = currentDate;
//           ref.read(imageProvider.notifier).state = 'assets/image-$day.jpg';
//           generateCalendar(forDate);
//           _scrollToDay(day);
//         },
//       );
//     });
//   }

//   void _scrollToDay(int day) {
//     final offset = (day - 1) * 50.0 * _scaleFactor;
//     _scrollController.animateTo(
//       offset,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }

//   Future<void> openDatePicker() async {
//     final now = DateTime.now();
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: now,
//       firstDate: now,
//       lastDate: DateTime(now.year + 3),
//     );

//     if (picked != null) {
//       ref.read(selectedDateProvider.notifier).state = picked;
//       ref.read(imageProvider.notifier).state = 'assets/image-${picked.day}.jpg';
//       generateCalendar(picked);
//       _scrollToDay(picked.day);
//     }
//   }

//   Widget buildHeader(DateTime date) {
//     final day = date.day.toString();
//     final month = DateFormat.MMMM().format(date);

//     return GestureDetector(
//       onTap: openDatePicker,
//       child: Container(
//         width: _baseWidth * _scaleFactor,
//         height: 100 * _scaleFactor,
//         color: const Color.fromARGB(255, 179, 5, 195),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(day, 
//               style: TextStyle(
//                 fontSize: 30 * _scaleFactor, 
//                 fontWeight: FontWeight.bold, 
//                 color: Colors.white
//               )),
//             Text(month, 
//               style: TextStyle(
//                 fontSize: 15 * _scaleFactor, 
//                 fontWeight: FontWeight.bold, 
//                 color: Colors.white
//               )),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildCalendarList() {
//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 10 * _scaleFactor),
//         child: Container(
//           width: _baseWidth * _scaleFactor,
//           color: Colors.black,
//           child: SingleChildScrollView(
//             controller: _scrollController,
//             child: Column(
//               children: calendarButtons
//                   .map((button) => Padding(
//                         padding: EdgeInsets.only(bottom: 5 * _scaleFactor),
//                         child: button,
//                       ))
//                   .toList(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTodayButton() {
//     return GestureDetector(
//       onTap: () {
//         final today = DateTime.now();
//         ref.read(selectedDateProvider.notifier).state = today;
//         ref.read(imageProvider.notifier).state = 'assets/image-${today.day}.jpg';
//         generateCalendar(today);
//         _scrollToDay(today.day);
//       },
//       child: Container(
//         width: _baseWidth * _scaleFactor,
//         height: 100 * _scaleFactor,
//         color: const Color.fromARGB(255, 179, 5, 195),
//         child: Center(
//           child: Text(
//             'TODAY',
//             style: TextStyle(
//               fontSize: 22 * _scaleFactor, 
//               fontWeight: FontWeight.bold, 
//               color: Colors.white
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final selectedDate = ref.watch(selectedDateProvider);

//     return Container(
//       width: _baseWidth * _scaleFactor,
//       height: MediaQuery.of(context).size.height,
//       color: Colors.black,
//       child: Column(
//         children: [
//           buildHeader(selectedDate),
//           buildCalendarList(),
//           buildTodayButton(),
//         ],
//       ),
//     );
//   }
// }
