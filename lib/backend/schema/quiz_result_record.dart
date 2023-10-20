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

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  void _initializeFields() {
    _quizId = snapshotData['quizId'] as String?;
    _score = castToType<double>(snapshotData['score']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _currentQuestion = castToType<int>(snapshotData['currentQuestion']);
    _answers = getDataList(snapshotData['answers']);
    _quizRef = snapshotData['quizRef'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _time = snapshotData['time'] as String?;
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
  String? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quizId': quizId,
      'score': score,
      'userRef': userRef,
      'currentQuestion': currentQuestion,
      'quizRef': quizRef,
      'createdAt': createdAt,
      'time': time,
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
        e1?.time == e2?.time;
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
        e?.time
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizResultRecord;
}
