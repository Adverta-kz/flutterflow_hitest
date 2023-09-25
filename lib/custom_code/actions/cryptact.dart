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

import 'dart:js';

Future<String> cryptact() async {
  var checkout = JsObject(context['cp']['Checkout'], [
    JsObject.jsify({
      'publicId': 'test_api_000000000000000002',
    })
  ]);

  var fieldValues = JsObject.jsify({
    'cvv': '911',
    'cardNumber': '4242 4242 4242 4242',
    'expDateMonth': '12',
    'expDateYear': '24',
  });

  try {
    var cryptogram =
        await checkout.callMethod('createPaymentCryptogram', [fieldValues]);
    return cryptogram.toString();
  } catch (errors) {
    return errors.toString();
  }
}
