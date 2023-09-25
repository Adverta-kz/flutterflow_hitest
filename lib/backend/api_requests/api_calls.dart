import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CloudTestCall {
  static Future<ApiCallResponse> call({
    int? amount = 50,
    String? cardCryptogramPacket =
        'eyJUeXBlIjoiQ2xvdWRDYXJkIiwibWV0YURhdGEiOnsiUGF5bWVudFVybCI6Imh0dHBzOi8vZGV2ZWxvcGVycy5jbG91ZHBheW1lbnRzLnJ1LyIsIlJlZmVycmVyVXJsIjoiaHR0cHM6Ly9kZXZlbG9wZXJzLmNsb3VkcGF5bWVudHMucnUvIn0sIkJyb3dzZXJJbmZvQmFzZTY0IjoiZXlKQlkyTmxjSFJJWldGa1pYSWlPaUlxTHlvaUxDSktZWFpoUlc1aFlteGxaQ0k2Wm1Gc2MyVXNJa3BoZG1GVFkzSnBjSFJGYm1GaWJHVmtJanAwY25WbExDSk1ZVzVuZFdGblpTSTZJbkoxSWl3aVEyOXNiM0pFWlhCMGFDSTZJakkwSWl3aVNHVnBaMmgwSWpvaU1UQTRNQ0lzSWxkcFpIUm9Jam9pTVRreU1DSXNJbFJwYldWYWIyNWxJam9pTFRNMk1DSXNJbFZ6WlhKQloyVnVkQ0k2SWsxdmVtbHNiR0V2TlM0d0lDaFhhVzVrYjNkeklFNVVJREV3TGpBN0lGZHBialkwT3lCNE5qUXBJRUZ3Y0d4bFYyVmlTMmwwTHpVek55NHpOaUFvUzBoVVRVd3NJR3hwYTJVZ1IyVmphMjhwSUVOb2NtOXRaUzh4TVRRdU1DNHdMakFnV1dGQ2NtOTNjMlZ5THpJekxqY3VOUzQzTXpRZ1dXOTNjMlZ5THpJdU5TQlRZV1poY21rdk5UTTNMak0ySW4wPSIsIkZvcm1hdCI6MSwiQ2FyZEluZm8iOnsiRmlyc3RTaXhEaWdpdHMiOiI0MjQyNDIiLCJMYXN0Rm91ckRpZ2l0cyI6IjQyNDIiLCJFeHBEYXRlWWVhciI6IjI1IiwiRXhwRGF0ZU1vbnRoIjoiMDEifSwiS2V5VmVyc2lvbiI6IjEzIiwiVmFsdWUiOiJCUEkwcjNtR3pYQ0ZpOC8rYmUyZ09NVWJkV3I5MGwyb3JWNzhxWEFKazdndzFFdGo5OWZCM1BqeGRVYlBWK2tVQTVaVkFWcXFvL3VJdHNGMlBMVnUrY1VSTG9OK01KSlROSEw5TU9JamZidGhaTGJpZWd3aDY4WCtLbFFCODZ6YmRXQ25xc2Y0OWlKQld0ZGZYZGtCcUV5VUtUYkg3a3RVeThwb09vb1lJNUthSVNoQ1RhZFk5c0M3NkYzVVlmN2tGaUR3Y09HZTJTOXFBRlY5RFVKTEN3NmJHbUw1SXdZdjBMZEd5MzJNZjhMRDQzdmlDUzVDTENpUGFLSFZkVVc5dzgreGVjd2h2NFFycm5aTDVzSjVmS2lMTmFwMTA4ZURrZWNBdnByT0s1NGIrZzBqT0lSakUyVjVobGw0ZzFMY1NKV2M5K1NDNHMxY2w5N0E0aDg4bkE9PSJ9',
    String? ipAddress = '79.142.54.219',
  }) {
    final ffApiRequestBody = '''
{
  "Amount": "50",
  "CardCryptogramPacket": "eyJUeXBlIjoiQ2xvdWRDYXJkIiwibWV0YURhdGEiOnsiUGF5bWVudFVybCI6Imh0dHBzOi8vZGV2ZWxvcGVycy5jbG91ZHBheW1lbnRzLnJ1LyIsIlJlZmVycmVyVXJsIjoiaHR0cHM6Ly9kZXZlbG9wZXJzLmNsb3VkcGF5bWVudHMucnUvIn0sIkJyb3dzZXJJbmZvQmFzZTY0IjoiZXlKQlkyTmxjSFJJWldGa1pYSWlPaUlxTHlvaUxDSktZWFpoUlc1aFlteGxaQ0k2Wm1Gc2MyVXNJa3BoZG1GVFkzSnBjSFJGYm1GaWJHVmtJanAwY25WbExDSk1ZVzVuZFdGblpTSTZJbkoxSWl3aVEyOXNiM0pFWlhCMGFDSTZJakkwSWl3aVNHVnBaMmgwSWpvaU1UQTRNQ0lzSWxkcFpIUm9Jam9pTVRreU1DSXNJbFJwYldWYWIyNWxJam9pTFRNMk1DSXNJbFZ6WlhKQloyVnVkQ0k2SWsxdmVtbHNiR0V2TlM0d0lDaFhhVzVrYjNkeklFNVVJREV3TGpBN0lGZHBialkwT3lCNE5qUXBJRUZ3Y0d4bFYyVmlTMmwwTHpVek55NHpOaUFvUzBoVVRVd3NJR3hwYTJVZ1IyVmphMjhwSUVOb2NtOXRaUzh4TVRRdU1DNHdMakFnV1dGQ2NtOTNjMlZ5THpJekxqY3VOUzQzTXpRZ1dXOTNjMlZ5THpJdU5TQlRZV1poY21rdk5UTTNMak0ySW4wPSIsIkZvcm1hdCI6MSwiQ2FyZEluZm8iOnsiRmlyc3RTaXhEaWdpdHMiOiI0MjQyNDIiLCJMYXN0Rm91ckRpZ2l0cyI6IjQyNDIiLCJFeHBEYXRlWWVhciI6IjI1IiwiRXhwRGF0ZU1vbnRoIjoiMDEifSwiS2V5VmVyc2lvbiI6IjEzIiwiVmFsdWUiOiJCUEkwcjNtR3pYQ0ZpOC8rYmUyZ09NVWJkV3I5MGwyb3JWNzhxWEFKazdndzFFdGo5OWZCM1BqeGRVYlBWK2tVQTVaVkFWcXFvL3VJdHNGMlBMVnUrY1VSTG9OK01KSlROSEw5TU9JamZidGhaTGJpZWd3aDY4WCtLbFFCODZ6YmRXQ25xc2Y0OWlKQld0ZGZYZGtCcUV5VUtUYkg3a3RVeThwb09vb1lJNUthSVNoQ1RhZFk5c0M3NkYzVVlmN2tGaUR3Y09HZTJTOXFBRlY5RFVKTEN3NmJHbUw1SXdZdjBMZEd5MzJNZjhMRDQzdmlDUzVDTENpUGFLSFZkVVc5dzgreGVjd2h2NFFycm5aTDVzSjVmS2lMTmFwMTA4ZURrZWNBdnByT0s1NGIrZzBqT0lSakUyVjVobGw0ZzFMY1NKV2M5K1NDNHMxY2w5N0E0aDg4bkE9PSJ9",
  "IpAddress": "79.142.54.219"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cloudTest',
      apiUrl: 'https://api.cloudpayments.ru/payments/cards/charge',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Basic cGtfODE3MTI5YTcxMTJhODMzMGY5YmI1OTU0MWU3Mjk6ZmQ4NjJiODI0ZGVjNzIyNTJiM2RhMDUwMmQzNTcwMWU=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FreedompayCall {
  static Future<ApiCallResponse> call({
    double? pgAmount,
    String? pgDescription = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'freedompay',
      apiUrl: 'https://test-api.freedompay.money/g2g/payment',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'pg_amount': pgAmount,
        'pg_currency': "KZT",
        'pg_description': pgDescription,
        'pg_merchant_id': "1",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TestCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'test',
      apiUrl: 'https://api.cloudpayments.ru/test',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Basic cGtfODE3MTI5YTcxMTJhODMzMGY5YmI1OTU0MWU3Mjk6ZmQ4NjJiODI0ZGVjNzIyNTJiM2RhMDUwMmQzNTcwMWU=',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TempCall {
  static Future<ApiCallResponse> call() {
    final ffApiRequestBody = '''
{
  "Amount": 10,
  "Currency": "KZT",
  "IpAddress": "123.123.123.123",
  "CardCryptogramPacket": "01492500008719030128SMfLeYdKp5dSQVIiO5l6ZCJiPdel4uDjdFTTz1UnXY+3QaZcNOW8lmXg0H670MclS4lI+qLkujKF4pR5Ri+T/E04Ufq3t5ntMUVLuZ998DLm+OVHV7FxIGR7snckpg47A73v7/y88Q5dxxvVZtDVi0qCcJAiZrgKLyLCqypnMfhjsgCEPF6d4OMzkgNQiynZvKysI2q+xc9cL0+CMmQTUPytnxX52k9qLNZ55cnE8kuLvqSK+TOG7Fz03moGcVvbb9XTg1oTDL4pl9rgkG3XvvTJOwol3JDxL1i6x+VpaRxpLJg0Zd9/9xRJOBMGmwAxo8/xyvGuAj85sxLJL6fA==",
  "Payer": {
    "Phone": "123"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'temp',
      apiUrl: 'https://api.cloudpayments.ru/payments/cards/charge',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Basic cGtfODE3MTI5YTcxMTJhODMzMGY5YmI1OTU0MWU3Mjk6ZmQ4NjJiODI0ZGVjNzIyNTJiM2RhMDUwMmQzNTcwMWU=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
