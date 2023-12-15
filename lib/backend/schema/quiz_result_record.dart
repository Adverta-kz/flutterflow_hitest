import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizResultRecord extends FirestoreRecord {
  QuizResultRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quizId" field.
  String? _quizId;
  String get quizId => _quizId ?? '';
  bool hasQuizId() => _quizId != null;

  // "score" field.
  double? _score;
  double get score => _score ?? 0.0;
  bool hasScore() => _score != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "currentQuestion" field.
  int? _currentQuestion;
  int get currentQuestion => _currentQuestion ?? 0;
  bool hasCurrentQuestion() => _currentQuestion != null;

  // "answers" field.
  List<String>? _answers;
  List<String> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  // "quizRef" field.
  DocumentReference? _quizRef;
  DocumentReference? get quizRef => _quizRef;
  bool hasQuizRef() => _quizRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "timer" field.
  String? _timer;
  String get timer => _timer ?? '';
  bool hasTimer() => _timer != null;

  // "indexUserResult" field.
  int? _indexUserResult;
  int get indexUserResult => _indexUserResult ?? 0;
  bool hasIndexUserResult() => _indexUserResult != null;

  void _initializeFields() {
    _quizId = snapshotData['quizId'] as String?;
    _score = castToType<double>(snapshotData['score']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _currentQuestion = castToType<int>(snapshotData['currentQuestion']);
    _answers = getDataList(snapshotData['answers']);
    _quizRef = snapshotData['quizRef'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _timer = snapshotData['timer'] as String?;
    _indexUserResult = castToType<int>(snapshotData['indexUserResult']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quizResult');

  static Stream<QuizResultRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizResultRecord.fromSnapshot(s));

  static Future<QuizResultRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizResultRecord.fromSnapshot(s));

  static QuizResultRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizResultRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizResultRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizResultRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizResultRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizResultRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizResultRecordData({
  String? quizId,
  double? score,
  DocumentReference? userRef,
  int? currentQuestion,
  DocumentReference? quizRef,
  DateTime? createdAt,
  DateTime? startTime,
  String? timer,
  int? indexUserResult,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quizId': quizId,
      'score': score,
      'userRef': userRef,
      'currentQuestion': currentQuestion,
      'quizRef': quizRef,
      'createdAt': createdAt,
      'startTime': startTime,
      'timer': timer,
      'indexUserResult': indexUserResult,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizResultRecordDocumentEquality implements Equality<QuizResultRecord> {
  const QuizResultRecordDocumentEquality();

  @override
  bool equals(QuizResultRecord? e1, QuizResultRecord? e2) {
    const listEquality = ListEquality();
    return e1?.quizId == e2?.quizId &&
        e1?.score == e2?.score &&
        e1?.userRef == e2?.userRef &&
        e1?.currentQuestion == e2?.currentQuestion &&
        listEquality.equals(e1?.answers, e2?.answers) &&
        e1?.quizRef == e2?.quizRef &&
        e1?.createdAt == e2?.createdAt &&
        e1?.startTime == e2?.startTime &&
        e1?.timer == e2?.timer &&
        e1?.indexUserResult == e2?.indexUserResult;
  }

  @override
  int hash(QuizResultRecord? e) => const ListEquality().hash([
        e?.quizId,
        e?.score,
        e?.userRef,
        e?.currentQuestion,
        e?.answers,
        e?.quizRef,
        e?.createdAt,
        e?.startTime,
        e?.timer,
        e?.indexUserResult
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizResultRecord;
}
