// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardStruct extends FFFirebaseStruct {
  CardStruct({
    int? cardNumber,
    int? cvv,
    int? year,
    int? month,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cardNumber = cardNumber,
        _cvv = cvv,
        _year = year,
        _month = month,
        super(firestoreUtilData);

  // "card_number" field.
  int? _cardNumber;
  int get cardNumber => _cardNumber ?? 0;
  set cardNumber(int? val) => _cardNumber = val;
  void incrementCardNumber(int amount) => _cardNumber = cardNumber + amount;
  bool hasCardNumber() => _cardNumber != null;

  // "cvv" field.
  int? _cvv;
  int get cvv => _cvv ?? 0;
  set cvv(int? val) => _cvv = val;
  void incrementCvv(int amount) => _cvv = cvv + amount;
  bool hasCvv() => _cvv != null;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  set year(int? val) => _year = val;
  void incrementYear(int amount) => _year = year + amount;
  bool hasYear() => _year != null;

  // "month" field.
  int? _month;
  int get month => _month ?? 0;
  set month(int? val) => _month = val;
  void incrementMonth(int amount) => _month = month + amount;
  bool hasMonth() => _month != null;

  static CardStruct fromMap(Map<String, dynamic> data) => CardStruct(
        cardNumber: castToType<int>(data['card_number']),
        cvv: castToType<int>(data['cvv']),
        year: castToType<int>(data['year']),
        month: castToType<int>(data['month']),
      );

  static CardStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CardStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'card_number': _cardNumber,
        'cvv': _cvv,
        'year': _year,
        'month': _month,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'card_number': serializeParam(
          _cardNumber,
          ParamType.int,
        ),
        'cvv': serializeParam(
          _cvv,
          ParamType.int,
        ),
        'year': serializeParam(
          _year,
          ParamType.int,
        ),
        'month': serializeParam(
          _month,
          ParamType.int,
        ),
      }.withoutNulls;

  static CardStruct fromSerializableMap(Map<String, dynamic> data) =>
      CardStruct(
        cardNumber: deserializeParam(
          data['card_number'],
          ParamType.int,
          false,
        ),
        cvv: deserializeParam(
          data['cvv'],
          ParamType.int,
          false,
        ),
        year: deserializeParam(
          data['year'],
          ParamType.int,
          false,
        ),
        month: deserializeParam(
          data['month'],
          ParamType.int,
          false,
        ),
      );

  static CardStruct fromAlgoliaData(Map<String, dynamic> data) => CardStruct(
        cardNumber: convertAlgoliaParam(
          data['card_number'],
          ParamType.int,
          false,
        ),
        cvv: convertAlgoliaParam(
          data['cvv'],
          ParamType.int,
          false,
        ),
        year: convertAlgoliaParam(
          data['year'],
          ParamType.int,
          false,
        ),
        month: convertAlgoliaParam(
          data['month'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CardStruct &&
        cardNumber == other.cardNumber &&
        cvv == other.cvv &&
        year == other.year &&
        month == other.month;
  }

  @override
  int get hashCode => const ListEquality().hash([cardNumber, cvv, year, month]);
}

CardStruct createCardStruct({
  int? cardNumber,
  int? cvv,
  int? year,
  int? month,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CardStruct(
      cardNumber: cardNumber,
      cvv: cvv,
      year: year,
      month: month,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CardStruct? updateCardStruct(
  CardStruct? card, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    card
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCardStructData(
  Map<String, dynamic> firestoreData,
  CardStruct? card,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (card == null) {
    return;
  }
  if (card.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && card.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cardData = getCardFirestoreData(card, forFieldValue);
  final nestedData = cardData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = card.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCardFirestoreData(
  CardStruct? card, [
  bool forFieldValue = false,
]) {
  if (card == null) {
    return {};
  }
  final firestoreData = mapToFirestore(card.toMap());

  // Add any Firestore field values
  card.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCardListFirestoreData(
  List<CardStruct>? cards,
) =>
    cards?.map((e) => getCardFirestoreData(e, true)).toList() ?? [];
