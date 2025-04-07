import 'package:flutter/material.dart';

class RoundCheckBox extends StatefulWidget {
  const RoundCheckBox({
    Key? key,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  State<RoundCheckBox> createState() => _RoundCheckBoxState();
}

class _RoundCheckBoxState extends State<RoundCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.isChecked);
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.deepOrange, width: 2),
          color: widget.isChecked ? Colors.deepOrange : Colors.transparent,
        ),
        child:
            widget.isChecked
                ? Icon(Icons.check, color: Colors.white, size: 20)
                : null,
      ),
    );
  }
}
