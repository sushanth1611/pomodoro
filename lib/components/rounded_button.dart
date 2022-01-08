// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final Function onPressed;

  const RoundedButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: const Color(0xffF57B7A),
        borderRadius: BorderRadius.circular(15.0),
        elevation: 2.0,
        child: MaterialButton(
          onPressed: () => onPressed(),
          child: const Text(
            'Start',
            style: TextStyle(
              fontFamily: 'BalsamiqSans',
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
