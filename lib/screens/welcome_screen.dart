// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pomodora/components/break_time_selector.dart';
import 'package:pomodora/components/rounded_button.dart';
import 'package:pomodora/components/work_time_selector.dart';
import 'package:pomodora/components/popup_card.dart';

class WelcomeScreen extends StatelessWidget {
  BreakTimeSelector bts = BreakTimeSelector();
  WorkTimeSelector wts = WorkTimeSelector();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
              child: const Text(
                'Pomodora',
                style: TextStyle(
                    fontFamily: 'TwinkleStar',
                    fontSize: 45.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffF57B7A)),
              ),
            ),
            const Expanded(
              child: Center(
                child: Image(
                  image: AssetImage('images/lets_start.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: const Text(
                'Select a work time from down',
                style: TextStyle(
                  fontFamily: 'BalsamiqSans',
                  fontSize: 22.0,
                  color: Color(0xffF79F37),
                ),
              ),
            ),
            wts,
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: const Text(
                'Select a break time from down',
                style: TextStyle(
                  fontFamily: 'BalsamiqSans',
                  fontSize: 22.0,
                  color: Color(0xffF79F37),
                ),
              ),
            ),
            bts,
            const SizedBox(height: 8.0),
            RoundedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => showPopupCard(context,wts.workTime,bts.breakTime),
                );
              },
            ),
            const SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }
}



