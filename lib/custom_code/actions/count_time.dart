// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> countTime(
  DateTime start,
  DateTime end,
) async {
  DateTime startDate = start;
  DateTime endDate = end;

  Duration difference = endDate.difference(startDate);

  int minutes = difference.inMinutes;
  int seconds = difference.inSeconds.remainder(60);

  String timeInMMSSFormat = '$minutes:${seconds.toString().padLeft(2, '0')}';

  return timeInMMSSFormat;
}
