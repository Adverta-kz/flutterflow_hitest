import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CloudTestCall {
  static Future<ApiCallResponse> call({
    String? amount = '',
    String? cvv = '',
    String? cardNumber = '',
    String? month = '',
    String? year = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Amount": "${amount}",
  "cvv": "${cvv}",
  "cardNumber": "${cardNumber}",
  "expDateMonth": "${month}",
  "expDateYear": "${year}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'cloudTest',
      apiUrl: 'http://185.146.1.93:8000/handle_cloudpayments',
      callType: ApiCallType.POST,
      headers: {},
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
  }) async {
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
  static Future<ApiCallResponse> call() async {
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
  static Future<ApiCallResponse> call() async {
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
