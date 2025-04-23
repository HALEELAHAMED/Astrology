import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:astrology/screens/kundali_match_screen.dart';

class HoroscopeMatchingDialog extends StatefulWidget {
  const HoroscopeMatchingDialog({super.key});

  @override
  State<HoroscopeMatchingDialog> createState() =>
      _HoroscopeMatchingDialogState();
}

class _HoroscopeMatchingDialogState extends State<HoroscopeMatchingDialog> {
  final _formKey = GlobalKey<FormState>();

  // Girl's details
  String? girlName;
  String? girlLocation;
  String? girlSelectedYear;
  String? girlSelectedDate;
  String? girlSelectedMonth;
  String? girlSelectedHour;
  String? girlSelectedMinute;
  String? girlSelectedSecond;

  // Boy's details
  String? boyName;
  String? boyLocation;
  String? boySelectedYear;
  String? boySelectedDate;
  String? boySelectedMonth;
  String? boySelectedHour;
  String? boySelectedMinute;
  String? boySelectedSecond;

  // Common lists
  final List<String> years = List.generate(
  DateTime.now().year - 1900 + 1,
  (index) => '${1900 + index}',
);
  final List<String> dates = List.generate(31, (index) => '${index + 1}');
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  final List<String> hours = List.generate(
    24,
    (index) => index.toString().padLeft(2, '0'),
  );
  final List<String> minutes = List.generate(
    60,
    (index) => index.toString().padLeft(2, '0'),
  );
  final List<String> seconds = List.generate(
    60,
    (index) => index.toString().padLeft(2, '0'),
  );

  @override
  void initState() {
    super.initState();
    // Initialize default values
    girlSelectedYear = years[20]; // Middle of the range
    girlSelectedDate = '15';
    girlSelectedMonth = 'January';
    girlSelectedHour = '12';
    girlSelectedMinute = '00';
    girlSelectedSecond = '00';
    girlLocation = 'Ujjain, Madhya Pradesh, India';

    boySelectedYear = years[20]; // Middle of the range
    boySelectedDate = '15';
    boySelectedMonth = 'January';
    boySelectedHour = '12';
    boySelectedMinute = '00';
    boySelectedSecond = '00';
    boyLocation = 'Ujjain, Madhya Pradesh, India';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Horoscope Matching',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // System Selection
            const Text(
              'Choose System',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Guna Milan',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              items:
                  ['Guna Milan', 'Ashtakoot', 'Manglik'].map((system) {
                    return DropdownMenuItem(value: system, child: Text(system));
                  }).toList(),
              onChanged: (value) {},
              validator:
                  (value) => value == null ? 'Please select a system' : null,
            ),
            const SizedBox(height: 20),

            // Partner Details Section
            _buildPartnerDetailsSection(),
            const SizedBox(height: 20),

            // Birth Date Section
            _buildBirthDateSection(),
            const SizedBox(height: 20),

            // Birth Time Section
            _buildBirthTimeSection(),
            const SizedBox(height: 24),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'MATCH KUNDALI',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPartnerDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Headers
        Row(
          children: [
            Expanded(
              child: _buildPartnerHeader(
                icon: Icons.female,
                title: "Girl's Details",
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: _buildPartnerHeader(
                icon: Icons.male,
                title: "Boy's Details",
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Names
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Girl Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator:
                    (value) =>
                        value?.isEmpty ?? true
                            ? 'Please enter girl name'
                            : null,
                onChanged: (value) => girlName = value,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Boy Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator:
                    (value) =>
                        value?.isEmpty ?? true ? 'Please enter boy name' : null,
                onChanged: (value) => boyName = value,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Locations
        const Text('Location', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter location',
                  hintText: 'E.g., Ujjain, Madhya Pradesh, India',
                ),
                controller: TextEditingController(text: girlLocation),
                validator:
                    (value) =>
                        value?.isEmpty ?? true
                            ? 'Please enter girl location'
                            : null,
                onChanged: (value) => girlLocation = value,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter location',
                  hintText: 'E.g., Ujjain, Madhya Pradesh, India',
                ),
                controller: TextEditingController(text: boyLocation),
                validator:
                    (value) =>
                        value?.isEmpty ?? true
                            ? 'Please enter boy location'
                            : null,
                onChanged: (value) => boyLocation = value,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPartnerHeader({required IconData icon, required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: Colors.deepOrange),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBirthDateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Birth Date', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildDateDropdowns(
                selectedYear: girlSelectedYear,
                selectedMonth: girlSelectedMonth,
                selectedDate: girlSelectedDate,
                onYearChanged:
                    (value) => setState(() => girlSelectedYear = value),
                onMonthChanged:
                    (value) => setState(() => girlSelectedMonth = value),
                onDateChanged:
                    (value) => setState(() => girlSelectedDate = value),
                validator:
                    (value) => value == null ? 'Please select date' : null,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildDateDropdowns(
                selectedYear: boySelectedYear,
                selectedMonth: boySelectedMonth,
                selectedDate: boySelectedDate,
                onYearChanged:
                    (value) => setState(() => boySelectedYear = value),
                onMonthChanged:
                    (value) => setState(() => boySelectedMonth = value),
                onDateChanged:
                    (value) => setState(() => boySelectedDate = value),
                validator:
                    (value) => value == null ? 'Please select date' : null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDateDropdowns({
    required String? selectedYear,
    required String? selectedMonth,
    required String? selectedDate,
    required ValueChanged<String?> onYearChanged,
    required ValueChanged<String?> onMonthChanged,
    required ValueChanged<String?> onDateChanged,
    required FormFieldValidator<String?> validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildDropdown(
                value: selectedYear,
                items: years,
                onChanged: onYearChanged,
                hint: 'Year',
                validator: validator,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDropdown(
                value: selectedMonth,
                items: months,
                onChanged: onMonthChanged,
                hint: 'Month',
                validator: validator,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDropdown(
                value: selectedDate,
                items: dates,
                onChanged: onDateChanged,
                hint: 'Date',
                validator: validator,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBirthTimeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Birth Time', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildTimeDropdowns(
                selectedHour: girlSelectedHour,
                selectedMinute: girlSelectedMinute,
                selectedSecond: girlSelectedSecond,
                onHourChanged:
                    (value) => setState(() => girlSelectedHour = value),
                onMinuteChanged:
                    (value) => setState(() => girlSelectedMinute = value),
                onSecondChanged:
                    (value) => setState(() => girlSelectedSecond = value),
                validator:
                    (value) => value == null ? 'Please select time' : null,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildTimeDropdowns(
                selectedHour: boySelectedHour,
                selectedMinute: boySelectedMinute,
                selectedSecond: boySelectedSecond,
                onHourChanged:
                    (value) => setState(() => boySelectedHour = value),
                onMinuteChanged:
                    (value) => setState(() => boySelectedMinute = value),
                onSecondChanged:
                    (value) => setState(() => boySelectedSecond = value),
                validator:
                    (value) => value == null ? 'Please select time' : null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeDropdowns({
    required String? selectedHour,
    required String? selectedMinute,
    required String? selectedSecond,
    required ValueChanged<String?> onHourChanged,
    required ValueChanged<String?> onMinuteChanged,
    required ValueChanged<String?> onSecondChanged,
    required FormFieldValidator<String?> validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildDropdown(
                value: selectedHour,
                items: hours,
                onChanged: onHourChanged,
                hint: 'HH',
                validator: validator,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDropdown(
                value: selectedMinute,
                items: minutes,
                onChanged: onMinuteChanged,
                hint: 'MM',
                validator: validator,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildDropdown(
                value: selectedSecond,
                items: seconds,
                onChanged: onSecondChanged,
                hint: 'SS',
                validator: validator,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    String? hint,
    required FormFieldValidator<String?> validator,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        hintText: hint,
      ),
      items:
          items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item, overflow: TextOverflow.ellipsis),
            );
          }).toList(),
      onChanged: onChanged,
      validator: validator,
      isExpanded: true, // Makes all dropdowns equal width
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      try {
        // Prepare the request body
        final requestBody = {
          "girlDetails": {
            "name": girlName,
            "location": _parseLocation(girlLocation!),
            "birthDate": {
              "year": int.parse(girlSelectedYear!),
              "month": months.indexOf(girlSelectedMonth!) + 1,
              "day": int.parse(girlSelectedDate!),
            },
            "birthTime": {
              "hour": int.parse(girlSelectedHour!),
              "minute": int.parse(girlSelectedMinute!),
              "second": int.parse(girlSelectedSecond!),
            },
          },
          "boyDetails": {
            "name": boyName,
            "location": _parseLocation(boyLocation!),
            "birthDate": {
              "year": int.parse(boySelectedYear!),
              "month": months.indexOf(boySelectedMonth!) + 1,
              "day": int.parse(boySelectedDate!),
            },
            "birthTime": {
              "hour": int.parse(boySelectedHour!),
              "minute": int.parse(boySelectedMinute!),
              "second": int.parse(boySelectedSecond!),
            },
          },
        };
        print('requestBody: ${jsonEncode(requestBody)}');

        // Make the API call
        final response = await http.post(
          Uri.parse('https://api.austrology.synxup.tech/kundali-matching'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(requestBody),
        );
        print('Response body: ${response.body}');
        // Close loading indicator
        Navigator.pop(context);

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          print('responseData: ${responseData['message']}');

          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (ctx) => MatchResultScreen(
                    girlName: girlName!,
                    boyName: boyName!,
                    matchData: responseData,
                  ),
            ),
          );
        
        } else {
          // Error handling
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${response.statusCode} - ${response.body}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        // Close loading indicator if still open
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Map<String, String> _parseLocation(String location) {
    // Simple parsing - you might want to improve this
    final parts = location.split(', ');
    return {
      "city": parts.isNotEmpty ? parts[0] : '',
      "state": parts.length > 1 ? parts[1] : '',
      "country": parts.length > 2 ? parts[2] : 'India', // default to India
    };
  }
}

