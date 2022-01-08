import 'package:flutter/material.dart';
import 'package:pomodora/screens/work_screen.dart';

Widget showPopupCard(BuildContext context, int workTime, int breakTime) {
  return AlertDialog(
    title: const Text(
      'Confirm selection',
      style: TextStyle(
        fontFamily: "TwinkleStar",
        fontSize: 32,
        color: Color(0xffF57B7A),
        fontWeight: FontWeight.w600,
      ),
    ),
    content: Text(
      'You have selected a combination of $workTime minute work time and $breakTime minute break time',
      style: const TextStyle(
        fontFamily: "BalsamiqSans",
        color: Color(0xffF79F37),
        fontSize: 20,
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text(
          'No',
          style: TextStyle(
            fontFamily: 'BalsamiqSans',
            color: Color(0xff64878C),
            fontSize: 25,
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WorkPage(
                breakTime: breakTime,
                workTime:  workTime,
              ),
            ),
          );
        },
        child: const Text(
          'Yes',
          style: TextStyle(
            fontFamily: 'BalsamiqSans',
            color: Color(0xff64878C),
            fontSize: 25,
          ),
        ),
      ),
    ],
  );
}
