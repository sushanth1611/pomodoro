// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class BreakTimeSelector extends StatefulWidget {
  int breakTime = 3;
  @override
  _BreakTimeSelectorState createState() => _BreakTimeSelectorState();
}

class _BreakTimeSelectorState extends State<BreakTimeSelector> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          title: const Text(
            '3 minutes',
            style: TextStyle(
              fontFamily: 'BalsamiqSans',
              fontSize: 18.0,
              color: Color(0xff64878C),
            ),
          ),
          leading: Radio<int>(
            value: 3,
            groupValue: widget.breakTime,
            activeColor: const Color(0xffF79F37),
            onChanged: (int? value) {
              setState(() {
                widget.breakTime = value!;
              });
            },
          ),
        ),
        ListTile(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          title: const Text(
            '5 minutes',
            style: TextStyle(
              fontFamily: 'BalsamiqSans',
              fontSize: 18.0,
              color: Color(0xff64878C),
            ),
          ),
          leading: Radio<int>(
            value: 5,
            groupValue: widget.breakTime,
            activeColor: const Color(0xffF79F37),
            onChanged: (int? value) {
              setState(() {
                widget.breakTime = value!;
              });
            },
          ),
        ),
        ListTile(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          title: const Text(
            '10 minutes',
            style: TextStyle(
              fontFamily: 'BalsamiqSans',
              fontSize: 18.0,
              color: Color(0xff64878C),
            ),
          ),
          leading: Radio<int>(
            value: 10,
            groupValue: widget.breakTime,
            activeColor: const Color(0xffF79F37),
            onChanged: (int? value) {
              setState(() {
                widget.breakTime = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}

