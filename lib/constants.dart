import 'package:flutter/material.dart';

enum WorkOrBreak { work, sbreak }

Map<WorkOrBreak, Color> percentColor = {
  WorkOrBreak.work: const Color(0xff5584AC),
  WorkOrBreak.sbreak: const Color(0xffF57B7A),
};

Map<WorkOrBreak, String> titleText = {
  WorkOrBreak.work: 'Work',
  WorkOrBreak.sbreak: 'Break',
};

Map<WorkOrBreak, int> buttonColor = {
  WorkOrBreak.work: 0xff5584AC,
  WorkOrBreak.sbreak: 0xffF57B7A,
};
