// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class WorkTimeSelector extends StatefulWidget {
  int workTime = 25;

  @override
  _WorkTimeSelectorState createState() => _WorkTimeSelectorState();
}

class _WorkTimeSelectorState extends State<WorkTimeSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          title: const Text(
            '25 minutes',
            style: TextStyle(
              fontFamily: 'BalsamiqSans',
              fontSize: 18.0,
              color: Color(0xff64878C),
            ),
          ),
          leading: Radio<int>(
            value: 25,
            groupValue: widget.workTime,
            activeColor: const Color(0xffF79F37),
            onChanged: (int? value) {
              setState(() {
                widget.workTime = value!;
              });
            },
          ),
        ),
        ListTile(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          title: const Text(
            '30 minutes',
            style: TextStyle(
              fontFamily: 'BalsamiqSans',
              fontSize: 18.0,
              color: Color(0xff64878C),
            ),
          ),
          leading: Radio<int>(
            value: 30,
            groupValue: widget.workTime,
            activeColor: const Color(0xffF79F37),
            onChanged: (int? value) {
              setState(() {
                widget.workTime = value!;
              });
            },
          ),
        ),
        ListTile(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          title: const Text(
            '45 minutes',
            style: TextStyle(
              fontFamily: 'BalsamiqSans',
              fontSize: 18.0,
              color: Color(0xff64878C),
            ),
          ),
          leading: Radio<int>(
            value: 45,
            groupValue: widget.workTime,
            activeColor: const Color(0xffF79F37),
            onChanged: (int? value) {
              setState(() {
                widget.workTime = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
