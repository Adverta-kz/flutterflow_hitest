import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizzesRecord extends FirestoreRecord {
  QuizzesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "results" field.
  List<DocumentReference>? _results;
  List<DocumentReference> get results => _results ?? const [];
  bool hasResults() => _results != null;

  // "usersList" field.
  List<DocumentReference>? _usersList;
  List<DocumentReference> get usersList => _usersList ?? const [];
  bool hasUsersList() => _usersList != null;

  // "quizName" field.
  String? _quizName;
  String get quizName => _quizName ?? '';
  bool hasQuizName() => _quizName != null;

  // "quizDescription" field.
  String? _quizDescription;
  String get quizDescription => _quizDescription ?? '';
  bool hasQuizDescription() => _quizDescription != null;

  // "numberQuestions" field.
  int? _numberQuestions;
  int get numberQuestions => _numberQuestions ?? 0;
  bool hasNumberQuestions() => _numberQuestions != null;

  // "questions" field.
  List<QuestionStruct>? _questions;
  List<QuestionStruct> get questions => _questions ?? const [];
  bool hasQuestions() => _questions != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "lastModifiedAt" field.
  DateTime? _lastModifiedAt;
  DateTime? get lastModifiedAt => _lastModifiedAt;
  bool hasLastModifiedAt() => _lastModifiedAt != null;

  // "teamMembers" field.
  List<DocumentReference>? _teamMembers;
  List<DocumentReference> get teamMembers => _teamMembers ?? const [];
  bool hasTeamMembers() => _teamMembers != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "listQuestions" field.
  List<DocumentReference>? _listQuestions;
  List<DocumentReference> get listQuestions => _listQuestions ?? const [];
  bool hasListQuestions() => _listQuestions != null;

  // "totalPoints" field.
  int? _totalPoints;
  int get totalPoints => _totalPoints ?? 0;
  bool hasTotalPoints() => _totalPoints != null;

  // "overallscore" field.
  int? _overallscore;
  int get overallscore => _overallscore ?? 0;
  bool hasOverallscore() => _overallscore != null;

  // "specification" field.
  String? _specification;
  String get specification => _specification ?? '';
  bool hasSpecification() => _specification != null;

  // "subjects" field.
  List<String>? _subjects;
  List<String> get subjects => _subjects ?? const [];
  bool hasSubjects() => _subjects != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "start_date" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  bool hasEndDate() => _endDate != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "photo_path" field.
  String? _photoPath;
  String get photoPath => _photoPath ?? '';
  bool hasPhotoPath() => _photoPath != null;

  void _initializeFields() {
    _results = getDataList(snapshotData['results']);
    _usersList = getDataList(snapshotData['usersList']);
    _quizName = snapshotData['quizName'] as String?;
    _quizDescription = snapshotData['quizDescription'] as String?;
    _numberQuestions = castToType<int>(snapshotData['numberQuestions']);
    _questions = getStructList(
      snapshotData['questions'],
      QuestionStruct.fromMap,
    );
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _lastModifiedAt = snapshotData['lastModifiedAt'] as DateTime?;
    _teamMembers = getDataList(snapshotData['teamMembers']);
    _status = snapshotData['status'] as String?;
    _listQuestions = getDataList(snapshotData['listQuestions']);
    _totalPoints = castToType<int>(snapshotData['totalPoints']);
    _overallscore = castToType<int>(snapshotData['overallscore']);
    _specification = snapshotData['specification'] as String?;
    _subjects = getDataList(snapshotData['subjects']);
    _price = castToType<int>(snapshotData['price']);
    _startDate = snapshotData['start_date'] as String?;
    _endDate = snapshotData['end_date'] as String?;
    _language = snapshotData['language'] as String?;
    _photoPath = snapshotData['photo_path'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quizzes');

  static Stream<QuizzesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizzesRecord.fromSnapshot(s));

  static Future<QuizzesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizzesRecord.fromSnapshot(s));

  static QuizzesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizzesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizzesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizzesRecord._(reference, mapFromFirestore(data));

  static QuizzesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      QuizzesRecord.getDocumentFromData(
        {
          'results': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['results'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'usersList': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['usersList'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'quizName': snapshot.data['quizName'],
          'quizDescription': snapshot.data['quizDescription'],
          'numberQuestions': convertAlgoliaParam(
            snapshot.data['numberQuestions'],
            ParamType.int,
            false,
          ),
          'questions': safeGet(
            () => (snapshot.data['questions'] as Iterable)
                .map((d) => QuestionStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'created_by': convertAlgoliaParam(
            snapshot.data['created_by'],
            ParamType.DocumentReference,
            false,
          ),
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'lastModifiedAt': convertAlgoliaParam(
            snapshot.data['lastModifiedAt'],
            ParamType.DateTime,
            false,
          ),
          'teamMembers': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['teamMembers'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'status': snapshot.data['status'],
          'listQuestions': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['listQuestions'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'totalPoints': convertAlgoliaParam(
            snapshot.data['totalPoints'],
            ParamType.int,
            false,
          ),
          'overallscore': convertAlgoliaParam(
            snapshot.data['overallscore'],
            ParamType.int,
            false,
          ),
          'specification': snapshot.data['specification'],
          'subjects': safeGet(
            () => snapshot.data['subjects'].toList(),
          ),
          'price': convertAlgoliaParam(
            snapshot.data['price'],
            ParamType.int,
            false,
          ),
          'start_date': snapshot.data['start_date'],
          'end_date': snapshot.data['end_date'],
          'language': snapshot.data['language'],
          'photo_path': snapshot.data['photo_path'],
        },
        QuizzesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<QuizzesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'quizzes',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'QuizzesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizzesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizzesRecordData({
  String? quizName,
  String? quizDescription,
  int? numberQuestions,
  DocumentReference? createdBy,
  DateTime? createdAt,
  DateTime? lastModifiedAt,
  String? status,
  int? totalPoints,
  int? overallscore,
  String? specification,
  int? price,
  String? startDate,
  String? endDate,
  String? language,
  String? photoPath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quizName': quizName,
      'quizDescription': quizDescription,
      'numberQuestions': numberQuestions,
      'created_by': createdBy,
      'created_at': createdAt,
      'lastModifiedAt': lastModifiedAt,
      'status': status,
      'totalPoints': totalPoints,
      'overallscore': overallscore,
      'specification': specification,
      'price': price,
      'start_date': startDate,
      'end_date': endDate,
      'language': language,
      'photo_path': photoPath,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizzesRecordDocumentEquality implements Equality<QuizzesRecord> {
  const QuizzesRecordDocumentEquality();

  @override
  bool equals(QuizzesRecord? e1, QuizzesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.results, e2?.results) &&
        listEquality.equals(e1?.usersList, e2?.usersList) &&
        e1?.quizName == e2?.quizName &&
        e1?.quizDescription == e2?.quizDescription &&
        e1?.numberQuestions == e2?.numberQuestions &&
        listEquality.equals(e1?.questions, e2?.questions) &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdAt == e2?.createdAt &&
        e1?.lastModifiedAt == e2?.lastModifiedAt &&
        listEquality.equals(e1?.teamMembers, e2?.teamMembers) &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.listQuestions, e2?.listQuestions) &&
        e1?.totalPoints == e2?.totalPoints &&
        e1?.overallscore == e2?.overallscore &&
        e1?.specification == e2?.specification &&
        listEquality.equals(e1?.subjects, e2?.subjects) &&
        e1?.price == e2?.price &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.language == e2?.language &&
        e1?.photoPath == e2?.photoPath;
  }

  @override
  int hash(QuizzesRecord? e) => const ListEquality().hash([
        e?.results,
        e?.usersList,
        e?.quizName,
        e?.quizDescription,
        e?.numberQuestions,
        e?.questions,
        e?.createdBy,
        e?.createdAt,
        e?.lastModifiedAt,
        e?.teamMembers,
        e?.status,
        e?.listQuestions,
        e?.totalPoints,
        e?.overallscore,
        e?.specification,
        e?.subjects,
        e?.price,
        e?.startDate,
        e?.endDate,
        e?.language,
        e?.photoPath
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizzesRecord;
}
