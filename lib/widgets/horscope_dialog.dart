 import 'package:flutter/material.dart';

// class HorscopeDialog extends StatelessWidget {
//   const HorscopeDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     bool isChecked = false;
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: SingleChildScrollView(
//         child: Container(
//           width: 480,
//           height: 600,
//           color: Colors.white,
//           child: Padding(
//             padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Checkbox(value: isChecked, onChanged: (context) {}),
//                     Text('Kundali'),
//                     Spacer(),
//                     Checkbox(value: isChecked, onChanged: (context) {}),
//                     Text('Matching'),
//                     Spacer(),
//                     Checkbox(value: isChecked, onChanged: (context) {}),
//                     Text('Consult'),
//                     Spacer(),
//                   ],
//                 ),
//                 Form(
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Name',
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: 130,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 1, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: 25),
//                           Text('31'),

//                           SizedBox(width: 38),
//                           IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.arrow_drop_down),
//                           ),
//                         ],
//                       ),
//                     ),

//                     Container(
//                       width: 130,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 1, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: 25),
//                           Text('January'),
//                           IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.arrow_drop_down),
//                           ),
//                         ],
//                       ),
//                     ),

//                     // SizedBox(width: 10,),
//                     Container(
//                       width: 130,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 1, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: 25),
//                           Text('2025'),

//                           // SizedBox(width: 38),
//                           // IconButton(
//                           //   onPressed: () {},
//                           //   icon: Icon(Icons.arrow_drop_down),
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: 130,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 1, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: 25),
//                           Text('17'),

//                           SizedBox(width: 38),
//                           IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.arrow_drop_down),
//                           ),
//                         ],
//                       ),
//                     ),

//                     Container(
//                       width: 130,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 1, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: 25),
//                           Text('41'),
//                           SizedBox(width: 38),
//                           IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.arrow_drop_down),
//                           ),
//                         ],
//                       ),
//                     ),

//                     Container(
//                       width: 130,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 1, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: 25),
//                           Text('32'),

//                           SizedBox(width: 38),
//                           IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.arrow_drop_down),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       width: 130,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 1, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: 25),
//                           Text('India'),

//                           SizedBox(width: 20),
//                           IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.arrow_drop_down),
//                           ),
//                         ],
//                       ),
//                     ),

//                     Container(
//                       width: 285,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 1, color: Colors.grey),
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: 25),
//                           Text('Hydrabad,Telengana,India'),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     TextButton(
//                       onPressed: () {},
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(Icons.add, size: 20, color: Colors.purple),
//                           SizedBox(height: 5),
//                           Text(
//                             'Advanced Options',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.purple,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),

//                 Form(
//                   key:
//                       GlobalKey<
//                         FormState
//                       >(), // Optional but useful for validation
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Email',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                      SizedBox(width: 20,),
//                       Expanded(
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             labelText: 'Phone',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//          SizedBox(height: 20,),
//           Row(
//             children: [
//               Container(
//                 width: 200,
//                 height: 50,
//                 decoration: BoxDecoration(
//                 border: Border.all(width: 1)
//                 ),
//                 child: DropdownButton(
//                   items: [DropdownMenuItem(child: Column(children: [
//                     Text('English')
//                   ],))], 
//                   onChanged: (context){}
//                   ),
//               ),
//             ],
//           ),




//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



class HorscopeDialog extends StatefulWidget {
  const HorscopeDialog({super.key});

  @override
  State<HorscopeDialog> createState() => _HorscopeDialogState();
}

class _HorscopeDialogState extends State<HorscopeDialog> {
  bool isKundaliChecked = false;
  bool isMatchingChecked = false;
  bool isConsultChecked = false;
  final _formKey = GlobalKey<FormState>();
  String? selectedDate = '31';
  String? selectedMonth = 'January';
  String? selectedYear = '2025';
  String? selectedHour = '17';
  String? selectedMinute = '41';
  String? selectedSecond = '32';
  String? selectedCountry = 'India';
  String? selectedCity = 'Hyderabad, Telangana, India';

  List<String> dates = List.generate(31, (index) => '${index + 1}');
  List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  List<String> years = List.generate(50, (index) => '${DateTime.now().year - 25 + index}');
  List<String> hours = List.generate(24, (index) => index.toString().padLeft(2, '0'));
  List<String> minutes = List.generate(60, (index) => index.toString().padLeft(2, '0'));
  List<String> seconds = List.generate(60, (index) => index.toString().padLeft(2, '0'));

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        child: Container(
          width: 480,
          constraints: const BoxConstraints(maxHeight: 600),
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
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
                TextFormField(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDropdown(
                      value: selectedCountry,
                      items: ['India', 'USA', 'UK', 'Canada'],
                      onChanged: (value) => setState(() => selectedCountry = value),
                      width: 130,
                    ),
                    SizedBox(
                      width: 285,
                      height: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'City, State, Country',
                        ),
                        controller: TextEditingController(text: selectedCity),
                        onChanged: (value) => selectedCity = value,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Handle advanced options
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, size: 20, color: Colors.purple),
                      SizedBox(width: 5),
                      Text(
                        'Advanced Options',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
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
                _buildLanguageDropdown(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, proceed with submission
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Get Horoscope',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
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
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.grey,
            ),
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildLanguageDropdown() {
    return SizedBox(
      width: 200,
      height: 50,
      child: DropdownButtonFormField<String>(
        value: 'English',
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        items: ['English', 'Hindi', 'Spanish', 'French'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {},
      ),
    );
  }
}