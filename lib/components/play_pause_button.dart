import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final int colorValue;

  const PlayPauseButton({required this.icon, required this.onPressed,required this.colorValue});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPressed(),
      fillColor: Color(colorValue),
      elevation: 2.0,
      constraints: const BoxConstraints.tightFor(
        width: 48.0,
        height: 44.0,
      ),
      child: Icon(
        icon,
        size: 38,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

