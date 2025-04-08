// import 'package:astrology/statemanager/image_change.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:astrology/widgets/buttons/leftcalender_button.dart';

// class LeftBar extends ConsumerStatefulWidget {
//   const LeftBar({super.key});

//   @override
//   ConsumerState<LeftBar> createState() => _LeftBarState();
// }

// class _LeftBarState extends ConsumerState<LeftBar> {
  
//   DateTime? selectedDate;
//   List<Widget> calendarButtons = [];
//   final ScrollController _scrollController = ScrollController();
//   String image = '1';

//   @override
//   void initState() {
//     super.initState();
//     generateCalendar(DateTime.now());
//   }

//   void generateCalendar(DateTime forDate) {
//     final now = DateTime.now();

//     int totalDays = DateUtils.getDaysInMonth(forDate.year, forDate.month);

//     calendarButtons = List.generate(totalDays, (index) {
//       final day = index + 1;
//       final currentButtonDate = DateTime(forDate.year, forDate.month, day);

//       bool isToday =
//           currentButtonDate.year == now.year &&
//           currentButtonDate.month == now.month &&
//           currentButtonDate.day == now.day;

//       bool isSelected =
//           selectedDate != null &&
//           currentButtonDate.year == selectedDate!.year &&
//           currentButtonDate.month == selectedDate!.month &&
//           currentButtonDate.day == selectedDate!.day;

//       return LeftcalenderButton(
//         date: '$day',
//         isToday: isToday,
//         isSelected: isSelected,
//         onTap: () {
//           setState(() {
//             selectedDate = currentButtonDate;
//             generateCalendar(forDate);
//             ref.read(imageProvider.notifier).state = 'assets/image-$day.jpg';
//             image = '$day';
//           });

//           onDateSelected(currentButtonDate);
//           _scrollToDay(day);
//         },
//       );
//     });
//   }

//   void onDateSelected(DateTime date) {
//     // Do anything here!

//     // You can trigger API calls, update parent widgets, etc.
//   }

//   void datePicker() async {
//     final now = DateTime.now();
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: now,
//       firstDate: now,
//       lastDate: DateTime(now.year + 3),
//     );

//     if (picked != null) {
//       setState(() {
//         selectedDate = picked;
//         generateCalendar(picked);
//       });
//       ref.read(imageProvider.notifier).state = 'assets/image-${picked.day}.jpg';
//       // Optional: Scroll to selected date
//       _scrollToDay(picked.day);
//     }
//   }

//   void _scrollToDay(int day) {
//     final double offset =
//         (day - 1) * 50.0; // adjust height if your buttons differ
//     _scrollController.animateTo(
//       offset,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//   }

//   Widget buildHeader(DateTime displayDate) {
//     final day = displayDate.day.toString();
//     final month = DateFormat.MMMM().format(displayDate); // using intl

//     return GestureDetector(
//       onTap: datePicker,
//       child: Container(
//         width: 80,
//         height: 100,
//         color: const Color.fromARGB(255, 179, 5, 195),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               day,
//               style: const TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             Text(
//               month,
//               style: const TextStyle(
//                 fontSize: 15,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildCalendarList() {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Container(
//           width: 80,
//           color: Colors.black,
//           child: SingleChildScrollView(
//             controller: _scrollController,
//             child: Column(
//               children:
//                   calendarButtons
//                       .map(
//                         (button) => Padding(
//                           padding: const EdgeInsets.only(bottom: 5),
//                           child: button,
//                         ),
//                       )
//                       .toList(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildTodayButton() {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedDate = null;
//           generateCalendar(DateTime.now());
//         });
//         _scrollToDay(DateTime.now().day);
//       },
//       child: Container(
//         width: 80,
//         height: 100,
//         color: const Color.fromARGB(255, 179, 5, 195),
//         child: const Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'TODAY',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final displayDate = selectedDate ?? DateTime.now();

//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: 80,
//       color: Colors.black,
//       child: Column(
//         children: [
//           buildHeader(displayDate),
//           buildCalendarList(),
//           buildTodayButton(),
//         ],
//       ),
//     );
//   }
// }


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
      firstDate: now,
      lastDate: DateTime(now.year + 3),
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
        width: 80,
        height: 100,
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
        ref.read(imageProvider.notifier).state = 'assets/image-${today.day}.jpg';
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
