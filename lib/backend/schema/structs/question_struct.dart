// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionStruct extends FFFirebaseStruct {
  QuestionStruct({
    String? name,
    String? shortDescription,
    int? correctOption,
    List<OptionsStruct>? options,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _shortDescription = shortDescription,
        _correctOption = correctOption,
        _options = options,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  set shortDescription(String? val) => _shortDescription = val;
  bool hasShortDescription() => _shortDescription != null;

  // "correctOption" field.
  int? _correctOption;
  int get correctOption => _correctOption ?? 0;
  set correctOption(int? val) => _correctOption = val;
  void incrementCorrectOption(int amount) =>
      _correctOption = correctOption + amount;
  bool hasCorrectOption() => _correctOption != null;

  // "options" field.
  List<OptionsStruct>? _options;
  List<OptionsStruct> get options => _options ?? const [];
  set options(List<OptionsStruct>? val) => _options = val;
  void updateOptions(Function(List<OptionsStruct>) updateFn) =>
      updateFn(_options ??= []);
  bool hasOptions() => _options != null;

  static QuestionStruct fromMap(Map<String, dynamic> data) => QuestionStruct(
        name: data['name'] as String?,
        shortDescription: data['shortDescription'] as String?,
        correctOption: castToType<int>(data['correctOption']),
        options: getStructList(
          data['options'],
          OptionsStruct.fromMap,
        ),
      );

  static QuestionStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? QuestionStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'shortDescription': _shortDescription,
        'correctOption': _correctOption,
        'options': _options?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'shortDescription': serializeParam(
          _shortDescription,
          ParamType.String,
        ),
        'correctOption': serializeParam(
          _correctOption,
          ParamType.int,
        ),
        'options': serializeParam(
          _options,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static QuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        shortDescription: deserializeParam(
          data['shortDescription'],
          ParamType.String,
          false,
        ),
        correctOption: deserializeParam(
          data['correctOption'],
          ParamType.int,
          false,
        ),
        options: deserializeStructParam<OptionsStruct>(
          data['options'],
          ParamType.DataStruct,
          true,
          structBuilder: OptionsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'QuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionStruct &&
        name == other.name &&
        shortDescription == other.shortDescription &&
        correctOption == other.correctOption &&
        listEquality.equals(options, other.options);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, shortDescription, correctOption, options]);
}

QuestionStruct createQuestionStruct({
  String? name,
  String? shortDescription,
  int? correctOption,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionStruct(
      name: name,
      shortDescription: shortDescription,
      correctOption: correctOption,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionStruct? updateQuestionStruct(
  QuestionStruct? question, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    question
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionStructData(
  Map<String, dynamic> firestoreData,
  QuestionStruct? question,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (question == null) {
    return;
  }
  if (question.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && question.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionData = getQuestionFirestoreData(question, forFieldValue);
  final nestedData = questionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = question.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionFirestoreData(
  QuestionStruct? question, [
  bool forFieldValue = false,
]) {
  if (question == null) {
    return {};
  }
  final firestoreData = mapToFirestore(question.toMap());

  // Add any Firestore field values
  question.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionListFirestoreData(
  List<QuestionStruct>? questions,
) =>
    questions?.map((e) => getQuestionFirestoreData(e, true)).toList() ?? [];
