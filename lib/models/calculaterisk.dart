import 'package:flutter/material.dart';
import 'package:gmcmanjeri_flutter/models/person.dart';

import 'dart:io';

import 'data_chol.dart';
import 'data_nochol.dart';

class ResultPredict {
  Person person;

  ResultPredict(this.person);

  int returnEle() {

    if(person.age <40 || person.age >70 )
      return 0;
    int position = 0;
    if (person.diabetes == false) position += 320;
    debugPrint("1: " + position.toString());
    if (person.gender == 1) position += 160;
    debugPrint("2: " + position.toString());
    if (person.smoker == true) position += 80;
    debugPrint("3: " + position.toString());
    position += ((70 - (person.age - (person.age % 10))) * 2);
    debugPrint("4: " + position.toString());
    position += ((180 - (person.sbp - (person.sbp % 20))) / 4).round();
    debugPrint("5: " + position.toString());
    position += (person.cholestrol - 4);
    debugPrint("6: " + position.toString());
    try {
      int position2 = position;
      debugPrint("position is;;" + position.toString());
      return whoIsh(position2, 0);
    } on IOException {
      // System.out.println("PRINTING NOT CORRECT");
      debugPrint("Not correct");
      return 4;
    }
  }

  int returnEle2() {
    int position = 0;
    if(person.age <40 || person.age >70 )
      return 0;

    if (!person.diabetes) position += 64;
    debugPrint("1: " + position.toString());
    if (person.gender == 1) position += 32;
    debugPrint("2: " + position.toString());
    if (person.smoker) position += 16;
    debugPrint("3: " + position.toString());


    position += ((-0.4 * person.age + 28)).round();
    debugPrint("4: " + position.toString());
    position += ((180 - person.sbp) / 20).round();
    debugPrint("5: " + position.toString());

    try {
      int position2 = position;
      return whoIsh(position2, 1);
    } on IOException {
      print("PRINTING NOT CORRECT");
      return 4;
    }
  }

  int whoIsh(int position, int value) {
    var result;
    if (value == 0)
      result = chol[position];
    else
      result = nochol[position];

    debugPrint("result: " + result);

    if (result == 'G')
      return 0;
    else if (result == 'Y')
      return 1;
    else if (result == 'O')
      return 2;
    else if (result == 'R')
      return 3;
    else if (result == 'D') return 4;
  }
}
