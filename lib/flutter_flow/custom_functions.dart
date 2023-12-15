import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int? increaseIndex(int? currentQuestion) {
  return currentQuestion != null ? currentQuestion + 1 : null;
}

double progressBarValueDemo(
  int? totalNumber,
  int? completedNumber,
) {
  if (totalNumber == null || completedNumber == null || totalNumber == 0) {
    return 0.0;
  }
  final value = completedNumber.toDouble() / totalNumber;
  if (value == 1.0) {
    return 1.0;
  }
  return value;
}

String listToString(List<String> list) {
  var result = "";
  for (var i = 0; i < list.length; i++) {
    result += list[i];
    result += " ";
  }
  return result;
}

bool? checkBalance(
  double balance,
  int quizCost,
) {
  if ((balance - quizCost) >= 0) {
    return true;
  }
  return false;
}

List<String> expdatayear(String exp) {
  var forSplit = exp.split("/");
  return forSplit;
}

bool check100(int sum) {
  if (sum >= 100) {
    return true;
  }
  return false;
}

bool checkExs(List<String> listin) {
  if (listin.isNotEmpty) {
    return true;
  }
  return false;
}

String? convertPhotToTxt(String? phot) {
  return phot;
}

bool? checkResult(
  double allResults,
  double currentResult,
) {
  if (currentResult <= allResults) {
    return false;
  } else {
    return true;
  }
}
