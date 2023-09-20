// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OptionsStruct extends FFFirebaseStruct {
  OptionsStruct({
    QuestionStruct? questionRef,
    String? optionName,
    int? index,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _questionRef = questionRef,
        _optionName = optionName,
        _index = index,
        super(firestoreUtilData);

  // "questionRef" field.
  QuestionStruct? _questionRef;
  QuestionStruct get questionRef => _questionRef ?? QuestionStruct();
  set questionRef(QuestionStruct? val) => _questionRef = val;
  void updateQuestionRef(Function(QuestionStruct) updateFn) =>
      updateFn(_questionRef ??= QuestionStruct());
  bool hasQuestionRef() => _questionRef != null;

  // "optionName" field.
  String? _optionName;
  String get optionName => _optionName ?? '';
  set optionName(String? val) => _optionName = val;
  bool hasOptionName() => _optionName != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;
  void incrementIndex(int amount) => _index = index + amount;
  bool hasIndex() => _index != null;

  static OptionsStruct fromMap(Map<String, dynamic> data) => OptionsStruct(
        questionRef: QuestionStruct.maybeFromMap(data['questionRef']),
        optionName: data['optionName'] as String?,
        index: castToType<int>(data['index']),
      );

  static OptionsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OptionsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'questionRef': _questionRef?.toMap(),
        'optionName': _optionName,
        'index': _index,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'questionRef': serializeParam(
          _questionRef,
          ParamType.DataStruct,
        ),
        'optionName': serializeParam(
          _optionName,
          ParamType.String,
        ),
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
      }.withoutNulls;

  static OptionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      OptionsStruct(
        questionRef: deserializeStructParam(
          data['questionRef'],
          ParamType.DataStruct,
          false,
          structBuilder: QuestionStruct.fromSerializableMap,
        ),
        optionName: deserializeParam(
          data['optionName'],
          ParamType.String,
          false,
        ),
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'OptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OptionsStruct &&
        questionRef == other.questionRef &&
        optionName == other.optionName &&
        index == other.index;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([questionRef, optionName, index]);
}

OptionsStruct createOptionsStruct({
  QuestionStruct? questionRef,
  String? optionName,
  int? index,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OptionsStruct(
      questionRef: questionRef ?? (clearUnsetFields ? QuestionStruct() : null),
      optionName: optionName,
      index: index,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OptionsStruct? updateOptionsStruct(
  OptionsStruct? options, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    options
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOptionsStructData(
  Map<String, dynamic> firestoreData,
  OptionsStruct? options,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (options == null) {
    return;
  }
  if (options.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && options.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final optionsData = getOptionsFirestoreData(options, forFieldValue);
  final nestedData = optionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = options.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOptionsFirestoreData(
  OptionsStruct? options, [
  bool forFieldValue = false,
]) {
  if (options == null) {
    return {};
  }
  final firestoreData = mapToFirestore(options.toMap());

  // Handle nested data for "questionRef" field.
  addQuestionStructData(
    firestoreData,
    options.hasQuestionRef() ? options.questionRef : null,
    'questionRef',
    forFieldValue,
  );

  // Add any Firestore field values
  options.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOptionsListFirestoreData(
  List<OptionsStruct>? optionss,
) =>
    optionss?.map((e) => getOptionsFirestoreData(e, true)).toList() ?? [];
