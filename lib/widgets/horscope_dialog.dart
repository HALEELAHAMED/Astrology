// import 'package:astrology/widgets/horoscope_matching_dialoge.dart';
// import 'package:flutter/material.dart';

// class HorscopeDialog extends StatefulWidget {
//   const HorscopeDialog({super.key});

//   @override
//   State<HorscopeDialog> createState() => _HorscopeDialogState();
// }

// class _HorscopeDialogState extends State<HorscopeDialog> {
//   bool isKundaliChecked = true; // Default to true for Kundali
//   bool isMatchingChecked = false;
//   bool isConsultChecked = false;

//   final _formKey = GlobalKey<FormState>();
//   String? selectedDate = '31';
//   String? selectedMonth = 'January';
//   String? selectedYear = '2025';
//   String? selectedHour = '17';
//   String? selectedMinute = '41';
//   String? selectedSecond = '32';
//   String? selectedCountry = 'India';
//   String? selectedCity = 'Hyderabad, Telangana, India';
//   String? selectedchart = 'ChartType';

//   double widthsize = 480;

//   List<String> dates = List.generate(31, (index) => '${index + 1}');
//   List<String> months = [
//     'January',
//     'February',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December',
//   ];
//   List<String> years = List.generate(
//     50,
//     (index) => '${DateTime.now().year - 25 + index}',
//   );
//   List<String> hours = List.generate(
//     24,
//     (index) => index.toString().padLeft(2, '0'),
//   );
//   List<String> minutes = List.generate(
//     60,
//     (index) => index.toString().padLeft(2, '0'),
//   );
//   List<String> seconds = List.generate(
//     60,
//     (index) => index.toString().padLeft(2, '0'),
//   );

//   Widget _buildFormContent() {
//     if (isMatchingChecked) {
//       return HoroscopeMatchingDialog();
//     } else if (isConsultChecked) {
//       return const Center(child: Text('Consult Content'));
//     } else {
//       // Default to Kundali content

//       return Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             TextFormField(
//               decoration: const InputDecoration(
//                 labelText: 'Name',
//                 border: OutlineInputBorder(),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your name';
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _buildDropdown(
//                   value: selectedDate,
//                   items: dates,
//                   onChanged: (value) => setState(() => selectedDate = value),
//                   width: 130,
//                 ),
//                 _buildDropdown(
//                   value: selectedMonth,
//                   items: months,
//                   onChanged: (value) => setState(() => selectedMonth = value),
//                   width: 130,
//                 ),
//                 _buildDropdown(
//                   value: selectedYear,
//                   items: years,
//                   onChanged: (value) => setState(() => selectedYear = value),
//                   width: 130,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _buildDropdown(
//                   value: selectedHour,
//                   items: hours,
//                   onChanged: (value) => setState(() => selectedHour = value),
//                   width: 130,
//                 ),
//                 _buildDropdown(
//                   value: selectedMinute,
//                   items: minutes,
//                   onChanged: (value) => setState(() => selectedMinute = value),
//                   width: 130,
//                 ),
//                 _buildDropdown(
//                   value: selectedSecond,
//                   items: seconds,
//                   onChanged: (value) => setState(() => selectedSecond = value),
//                   width: 130,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _buildDropdown(
//                   value: selectedCountry,
//                   items: ['India', 'USA', 'UK', 'Canada'],
//                   onChanged: (value) => setState(() => selectedCountry = value),
//                   width: 130,
//                 ),
//                 SizedBox(
//                   width: 285,
//                   height: 50,
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'City, State, Country',
//                     ),
//                     controller: TextEditingController(text: selectedCity),
//                     onChanged: (value) => selectedCity = value,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             TextButton(
//               onPressed: () {
//                 // Handle advanced options
//               },
//               child: const Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.add, size: 20, color: Colors.purple),
//                   SizedBox(width: 5),
//                   Text(
//                     'Advanced Options',
//                     style: TextStyle(fontSize: 16, color: Colors.purple),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Email',
//                       border: OutlineInputBorder(),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       if (!value.contains('@')) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 Expanded(
//                   child: TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Phone',
//                       border: OutlineInputBorder(),
//                     ),
//                     keyboardType: TextInputType.phone,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your phone number';
//                       }
//                       if (value.length < 10) {
//                         return 'Phone number too short';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [_buildLanguageDropdown(), _buildChartDropdown()],
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   // Form is valid, proceed with submission
//                   Navigator.pop(context);
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepOrange,
//                 minimumSize: const Size(double.infinity, 50),
//               ),
//               child: const Text(
//                 'Get Horoscope',
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: SingleChildScrollView(
//         child: Container(
//           width: widthsize,
//           constraints: const BoxConstraints(maxHeight: 700),
//           color: Colors.white,
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 children: [
//                   _buildRoundedCheckbox(
//                     value: isKundaliChecked,
//                     onChanged: (value) {
//                       setState(() {
//                         isKundaliChecked = value!;
//                         if (isKundaliChecked) {
//                           isMatchingChecked = false;
//                           isConsultChecked = false;
//                           widthsize = 480;
//                         }
//                       });
//                     },
//                     label: 'Kundali',
//                   ),
//                   const Spacer(),
//                   _buildRoundedCheckbox(
//                     value: isMatchingChecked,
//                     onChanged: (value) {
//                       setState(() {
//                         isMatchingChecked = value!;
//                         if (isMatchingChecked) {
//                           isKundaliChecked = false;
//                           isConsultChecked = false;
//                           widthsize = 900;
//                         }
//                       });
//                     },
//                     label: 'Matching',
//                   ),
//                   const Spacer(),
//                   _buildRoundedCheckbox(
//                     value: isConsultChecked,
//                     onChanged: (value) {
//                       setState(() {
//                         isConsultChecked = value!;
//                         if (isConsultChecked) {
//                           isKundaliChecked = false;
//                           isMatchingChecked = false;
//                         }
//                       });
//                     },
//                     label: 'Consult',
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               _buildFormContent(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildRoundedCheckbox({
//     required bool value,
//     required ValueChanged<bool?> onChanged,
//     required String label,
//   }) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 24,
//           height: 24,
//           child: Theme(
//             data: Theme.of(
//               context,
//             ).copyWith(unselectedWidgetColor: Colors.grey),
//             child: Checkbox(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               value: value,
//               onChanged: onChanged,
//               activeColor: Colors.deepOrange,
//             ),
//           ),
//         ),
//         const SizedBox(width: 8),
//         Text(label),
//       ],
//     );
//   }

//   Widget _buildDropdown({
//     required String? value,
//     required List<String> items,
//     required ValueChanged<String?> onChanged,
//     required double width,
//   }) {
//     return SizedBox(
//       width: width,
//       height: 50,
//       child: DropdownButtonFormField<String>(
//         value: value,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
//           contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//         ),
//         items:
//             items.map((String value) {
//               return DropdownMenuItem<String>(value: value, child: Text(value));
//             }).toList(),
//         onChanged: onChanged,
//       ),
//     );
//   }

//   Widget _buildLanguageDropdown() {
//     return SizedBox(
//       width: 210,
//       height: 60,
//       child: DropdownButtonFormField<String>(
//         value: 'English',
//         decoration: InputDecoration(
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
//         ),
//         items:
//             ['English', 'Hindi', 'Spanish', 'French'].map((String value) {
//               return DropdownMenuItem<String>(value: value, child: Text(value));
//             }).toList(),
//         onChanged: (value) {},
//       ),
//     );
//   }

//   Widget _buildChartDropdown() {
//     return SizedBox(
//       width: 210,
//       height: 60,
//       child: DropdownButtonFormField<String>(
//         value: 'ChartType',
//         decoration: InputDecoration(
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
//         ),
//         items:
//             ['ChartType', 'ChartType1', 'ChartType2', 'ChartType3'].map((
//               String value,
//             ) {
//               return DropdownMenuItem<String>(value: value, child: Text(value));
//             }).toList(),
//         onChanged: (value) {},
//       ),
//     );
//   }
// }

import 'package:astrology/screens/birth_details_screen.dart';
import 'package:astrology/widgets/horoscope_matching_dialoge.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HorscopeDialog extends StatefulWidget {
  const HorscopeDialog({super.key});

  @override
  State<HorscopeDialog> createState() => _HorscopeDialogState();
}

class _HorscopeDialogState extends State<HorscopeDialog> {
  bool isKundaliChecked = true;
  bool isMatchingChecked = false;
  bool isConsultChecked = false;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  String? selectedDate = '31';
  String? selectedMonth = 'January';
  String? selectedYear = '2025';
  String? selectedHour = '17';
  String? selectedMinute = '41';
  String? selectedSecond = '32';
  //String? selectedCountry = 'India';
  String? selectedLanguage = 'en';
  String? selectedGender = 'male';

  double widthsize = 480;

List<String> cities = [];
String? selectedCountry;
String? selectedCity;

Future<void> fetchCities(String country) async {
  try {
    // Use a reliable API (Country-State-City API)
    final url = Uri.parse(
      'https://api.countrystatecity.in/v1/countries/${getCountryCode(country)}/cities',
    );

    final response = await http.get(
      url,
      headers: {'X-CSCAPI-KEY': 'YOUR_API_KEY'}, // Get free key from api.countrystatecity.in
    );

    if (response.statusCode == 200) {
      final List<dynamic> cityData = jsonDecode(response.body);
      setState(() {
        cities = cityData.map((city) => city['name'].toString()).toList();
      });
    } else {
      throw Exception('Failed to load cities');
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error loading cities: ${e.toString()}')),
    );
  }
}

// Helper to convert country name to ISO code
String getCountryCode(String country) {
  const countryCodes = {
    'India': 'IN',
    'USA': 'US',
    'UK': 'GB',
    'Canada': 'CA',
  };
  return countryCodes[country] ?? 'US';
}



  List<String> dates = List.generate(31, (index) => '${index + 1}');
  List<String> months = [
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
  List<String> years = List.generate(
    50,
    (index) => '${DateTime.now().year - 25 + index}',
  );
  List<String> hours = List.generate(
    24,
    (index) => index.toString().padLeft(2, '0'),
  );
  List<String> minutes = List.generate(
    60,
    (index) => index.toString().padLeft(2, '0'),
  );
  List<String> seconds = List.generate(
    60,
    (index) => index.toString().padLeft(2, '0'),
  );

  Widget _buildFormContent() {
    if (isMatchingChecked) {
      return HoroscopeMatchingDialog();
    } else if (isConsultChecked) {
      return const Center(child: Text('Consult Content'));
    } else {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdown(
                  value: selectedDate,
                  items: dates,
                  onChanged: (value) => setState(() => selectedDate = value),
                  width: 130,
                ),
                _buildDropdown(
                  value: selectedMonth,
                  items: months,
                  onChanged: (value) => setState(() => selectedMonth = value),
                  width: 130,
                ),
                _buildDropdown(
                  value: selectedYear,
                  items: years,
                  onChanged: (value) => setState(() => selectedYear = value),
                  width: 130,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdown(
                  value: selectedHour,
                  items: hours,
                  onChanged: (value) => setState(() => selectedHour = value),
                  width: 130,
                ),
                _buildDropdown(
                  value: selectedMinute,
                  items: minutes,
                  onChanged: (value) => setState(() => selectedMinute = value),
                  width: 130,
                ),
                _buildDropdown(
                  value: selectedSecond,
                  items: seconds,
                  onChanged: (value) => setState(() => selectedSecond = value),
                  width: 130,
                ),
              ],
            ),
            const SizedBox(height: 10),


            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     _buildDropdown(
            //       value: selectedCountry,
            //       items: ['India', 'USA', 'UK', 'Canada'],
            //       onChanged: (value) => setState(() => selectedCountry = value),
            //       width: 130,
            //     ),
            //     SizedBox(
            //       width: 285,
            //       height: 50,
            //       child: TextFormField(
            //         controller: _cityController,
            //         decoration: const InputDecoration(
            //           border: OutlineInputBorder(),
            //           hintText: 'City, State, Country',
            //         ),
            //         validator: (value) {
            //           if (value == null || value.isEmpty) {
            //             return 'Please enter your city';
            //           }
            //           return null;
            //         },
            //       ),
            //     ),
            //   ],
            // ),


            Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    // Country Dropdown
    _buildDropdown(
      value: selectedCountry,
      items: ['India', 'USA', 'UK', 'Canada'],
      onChanged: (value) {
        setState(() {
          selectedCountry = value;
          selectedCity = null; // Reset city when country changes
        });
        fetchCities(value!); // Fetch cities for selected country
      },
      width: 130,
    ),
    
    // City Dropdown (Dynamic)
    SizedBox(
      width: 285,
      child: DropdownSearch<String>(
        items: cities,
        selectedItem: selectedCity,
        onChanged: (value) => setState(() => selectedCity = value),
        popupProps: const PopupProps.menu(
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(hintText: "Search city..."),
          ),
        ),
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Select city',
            labelText: 'City',
          ),
        ),
        validator: (value) => value == null ? 'Please select a city' : null,
      ),
    ),
  ],
),

            
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, size: 20, color: Colors.purple),
                  SizedBox(width: 5),
                  Text(
                    'Advanced Options',
                    style: TextStyle(fontSize: 16, color: Colors.purple),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (value.length < 10) {
                        return 'Phone number too short';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildLanguageDropdown(), _buildGenderDropdown()],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                minimumSize: const Size(double.infinity, 50),
              ),
              child:
                  _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                        'Get Horoscope',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        // final birthDate = '$selectedYear-${_getMonthNumber(selectedMonth!)}-${selectedDate!.padLeft(2, '0')}';
        // final birthTime = '$selectedHour:$selectedMinute:$selectedSecond';
        final year = int.parse(selectedYear!);
        final month = months.indexOf(selectedMonth!) + 1;
        final day = int.parse(selectedDate!);

        // Parse the time components
        final hours = int.parse(selectedHour!);
        final minutes = int.parse(selectedMinute!);
        final period = hours >= 12 ? 'PM' : 'AM';
        final formattedHours = hours > 12 ? hours - 12 : hours;

        final birthDetails = {
          'name': _nameController.text,
          'gender': selectedGender?.toLowerCase(), // 'male' instead of 'Male'
          'birthDate': {'year': year, 'month': month, 'day': day},
          'birthTime': {
            'hours': formattedHours,
            'minutes': minutes,
            'period': period,
          },
          'placeOfBirth': '${_cityController.text}, $selectedCountry',
          'language':
              selectedLanguage?.toLowerCase(), // 'en' instead of 'English'
          'email': _emailController.text,
          'phone': _phoneController.text,
        };

        final response = await http.post(
          Uri.parse('https://api.austrology.synxup.tech/birth-details'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(birthDetails),
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          print('Response: $responseData');

          // Navigate to BirthDetailsScreen with the response data
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                      BirthDetailsScreen(astrologyData: responseData['data']),
            ),
          );
        } else {
          _showErrorDialog(
            context,
            'Failed to fetch horoscope. Status code: ${response.statusCode}',
          );
        }
      } catch (e) {
        _showErrorDialog(context, 'An error occurred: ${e.toString()}');
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showSuccessDialog(BuildContext context, dynamic responseData) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Success'),
            content: Text(
              'Horoscope generated successfully!\n\n${responseData['message'] ?? ''}',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  String _getMonthNumber(String month) {
    final monthIndex = months.indexOf(month) + 1;
    return monthIndex.toString().padLeft(2, '0');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Container(
          width: widthsize,
          constraints: const BoxConstraints(maxHeight: 900),
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  _buildRoundedCheckbox(
                    value: isKundaliChecked,
                    onChanged: (value) {
                      setState(() {
                        isKundaliChecked = value!;
                        if (isKundaliChecked) {
                          isMatchingChecked = false;
                          isConsultChecked = false;
                          widthsize = 480;
                        }
                      });
                    },
                    label: 'Kundali',
                  ),
                  const Spacer(),
                  _buildRoundedCheckbox(
                    value: isMatchingChecked,
                    onChanged: (value) {
                      setState(() {
                        isMatchingChecked = value!;
                        if (isMatchingChecked) {
                          isKundaliChecked = false;
                          isConsultChecked = false;
                          widthsize = 900;
                        }
                      });
                    },
                    label: 'Matching',
                  ),
                  const Spacer(),
                  _buildRoundedCheckbox(
                    value: isConsultChecked,
                    onChanged: (value) {
                      setState(() {
                        isConsultChecked = value!;
                        if (isConsultChecked) {
                          isKundaliChecked = false;
                          isMatchingChecked = false;
                        }
                      });
                    },
                    label: 'Consult',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildFormContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedCheckbox({
    required bool value,
    required ValueChanged<bool?> onChanged,
    required String label,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Theme(
            data: Theme.of(
              context,
            ).copyWith(unselectedWidgetColor: Colors.grey),
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              value: value,
              onChanged: onChanged,
              activeColor: Colors.deepOrange,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required double width,
  }) {
    return SizedBox(
      width: width,
      height: 50,
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
        items:
            items.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildLanguageDropdown() {
    return SizedBox(
      width: 210,
      height: 60,
      child: DropdownButtonFormField<String>(
        value: selectedLanguage,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
        items:
            ['en', 'ml', 'ta', 'hi', 'gu'].map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
        onChanged: (value) {
          setState(() => selectedLanguage = value);
        },
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return SizedBox(
      width: 210,
      height: 60,
      child: DropdownButtonFormField<String>(
        value: selectedGender,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
        items:
            ['male', 'female'].map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
        onChanged: (value) {
          setState(() => selectedGender = value);
        },
      ),
    );
  }
}
