// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';

import 'package:pomodora/components/play_pause_button.dart';
import 'package:pomodora/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomodora/screens/welcome_screen.dart';

class WorkPage extends StatefulWidget {
  int workTime;
  int breakTime;

  WorkPage({required this.workTime, required this.breakTime});

  @override
  State<WorkPage> createState() => _WorkPageState();
}


class _WorkPageState extends State<WorkPage> {
  WorkOrBreak status = WorkOrBreak.work;
  int noOfTimes = 0;
  int timeInMinute = 0;
  int timeInSec = 0;
  double percent = 0;
  Timer? _timer;
  bool pause = true;
  List<Icon> timesCompleted = [];

  _updateList() {
    for (int i = 0; i < noOfTimes; i++) {
      timesCompleted.add(
        const Icon(
          Icons.check_circle,
          color: Color(0xffA6CF98),
          size: 35,
        ),
      );
    }
  }

  _timerTime() {
    if (status == WorkOrBreak.work) {
      setState(() {
        timeInMinute = widget.workTime;
        timeInSec = timeInMinute * 60;
      });
    } else {
      setState(() {
        timeInMinute = widget.breakTime;
        timeInSec = timeInMinute * 60;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _timerTime();
    _startTimer();
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: Row(
                children: const [
                  Text(
                    'Pomodoro',
                    style: TextStyle(
                      fontFamily: 'TwinkleStar',
                      fontSize: 45.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffF79F37),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              titleText[status]!,
              style: TextStyle(
                fontFamily: 'BalsamiqSans',
                fontSize: 42.0,
                color: percentColor[status],
              ),
            ),
            Expanded(
              child: CircularPercentIndicator(
                percent: _getPercentage(),
                radius: 250.0,
                lineWidth: 15.0,
                animation: true,
                animateFromLastPercent: true,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: percentColor[status],
                center: Text(
                  _secondsToFormattedString(timeInSec),
                  style: const TextStyle(
                    fontSize: 33.0,
                    fontFamily: "BalsamiqSans",
                    color: Color(0xffFABB51),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: timesCompleted,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlayPauseButton(
                  icon: _pauseOrPlay(),
                  colorValue: buttonColor[status]!,
                  onPressed: () {
                    if (pause == true) {
                      _startTimer();
                    } else {
                      _pauseTimer();
                    }
                  },
                ),
                const SizedBox(
                  width: 35,
                ),
                PlayPauseButton(
                  icon: Icons.replay,
                  colorValue: buttonColor[status]!,
                  onPressed: () {
                    _pauseTimer();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _showPopupCard3(context),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  _cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  _startTimer() {
    _cancelTimer();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => {
        if (timeInSec > 0)
          {
            setState(
              () {
                pause = false;
                timeInSec--;
              },
            ),
          }
        else
          {
            _playSound(),
            if (status == WorkOrBreak.work)
              {
                _breakStart(),
              }
            else
              {
                _cancelTimer(),
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _showPopupCard2(context),
                ),
              },
          },
      },
    );
  }

  _breakStart() {
    setState(
      () {
        status = WorkOrBreak.sbreak;
        _timerTime();
        _cancelTimer();
        _startTimer();
      },
    );
  }

  _pauseTimer() {
    setState(
      () {
        pause = true;
      },
    );
    _cancelTimer();
  }

  _getPercentage() {
    int totalTime = timeInMinute * 60;
    double percentage = 0;

    if (timeInSec > 0) {
      percentage = (totalTime - timeInSec) / totalTime;
    }

    return percentage;
  }

  _secondsToFormattedString(int seconds) {
    int roundedMinutes = seconds ~/ 60;
    int remainingSeconds = seconds - (roundedMinutes * 60);
    String remainingSecondsFormatted;
    String roundedMinutesFormatted;
    if (remainingSeconds < 10) {
      remainingSecondsFormatted = "0$remainingSeconds";
    } else {
      remainingSecondsFormatted = remainingSeconds.toString();
    }
    if (roundedMinutes < 10) {
      roundedMinutesFormatted = "0$roundedMinutes";
    } else {
      roundedMinutesFormatted = roundedMinutes.toString();
    }
    return '$roundedMinutesFormatted:$remainingSecondsFormatted';
  }

  _pauseOrPlay() {
    if (pause == false) {
      return Icons.pause;
    } else {
      return Icons.play_arrow;
    }
  }

  _playSound() {
    final player = AudioCache();
    player.play('mixkit-correct-answer-reward-952.wav');
  }

  Widget _showPopupCard3(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Quit??',
        style: TextStyle(
          fontFamily: "TwinkleStar",
          fontSize: 32,
          color: Color(0xffF57B7A),
          fontWeight: FontWeight.w600,
        ),
      ),
      content: const Text(
        "You have came this far? Are you sure you want to quit?",
        style: TextStyle(
          fontFamily: "BalsamiqSans",
          color: Color(0xffF79F37),
          fontSize: 20,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            _startTimer();
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
                builder: (context) => WelcomeScreen(),
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

  Widget _showPopupCard2(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Can you try again 😉',
        style: TextStyle(
          fontFamily: "TwinkleStar",
          fontSize: 32,
          color: Color(0xffF57B7A),
          fontWeight: FontWeight.w600,
        ),
      ),
      content: const Text(
        "Let's do this again.How was your result last time?Can you do it again?",
        style: TextStyle(
          fontFamily: "BalsamiqSans",
          color: Color(0xffF79F37),
          fontSize: 20,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => WelcomeScreen(),
              ),
            );
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
            Navigator.of(context).pop();
            setState(
              () {
                status = WorkOrBreak.work;
                _timerTime();
                _cancelTimer();
                _startTimer();
                timesCompleted.clear();
                noOfTimes += 1;
                _updateList();
              },
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
}

