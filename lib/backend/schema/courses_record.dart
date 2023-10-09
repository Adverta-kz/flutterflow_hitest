import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "industry" field.
  String? _industry;
  String get industry => _industry ?? '';
  bool hasIndustry() => _industry != null;

  // "business_name" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "cost" field.
  String? _cost;
  String get cost => _cost ?? '';
  bool hasCost() => _cost != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "subjects" field.
  List<String>? _subjects;
  List<String> get subjects => _subjects ?? const [];
  bool hasSubjects() => _subjects != null;

  // "contact_number" field.
  String? _contactNumber;
  String get contactNumber => _contactNumber ?? '';
  bool hasContactNumber() => _contactNumber != null;

  // "methodic" field.
  String? _methodic;
  String get methodic => _methodic ?? '';
  bool hasMethodic() => _methodic != null;

  // "forWho" field.
  String? _forWho;
  String get forWho => _forWho ?? '';
  bool hasForWho() => _forWho != null;

  // "why" field.
  String? _why;
  String get why => _why ?? '';
  bool hasWhy() => _why != null;

  void _initializeFields() {
    _industry = snapshotData['industry'] as String?;
    _businessName = snapshotData['business_name'] as String?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _duration = snapshotData['duration'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _cost = snapshotData['cost'] as String?;
    _author = snapshotData['author'] as DocumentReference?;
    _subjects = getDataList(snapshotData['subjects']);
    _contactNumber = snapshotData['contact_number'] as String?;
    _methodic = snapshotData['methodic'] as String?;
    _forWho = snapshotData['forWho'] as String?;
    _why = snapshotData['why'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  static CoursesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CoursesRecord.getDocumentFromData(
        {
          'industry': snapshot.data['industry'],
          'business_name': snapshot.data['business_name'],
          'start_date': convertAlgoliaParam(
            snapshot.data['start_date'],
            ParamType.DateTime,
            false,
          ),
          'title': snapshot.data['title'],
          'description': snapshot.data['description'],
          'duration': snapshot.data['duration'],
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'email': snapshot.data['email'],
          'photo_url': snapshot.data['photo_url'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'end_date': convertAlgoliaParam(
            snapshot.data['end_date'],
            ParamType.DateTime,
            false,
          ),
          'cost': snapshot.data['cost'],
          'author': convertAlgoliaParam(
            snapshot.data['author'],
            ParamType.DocumentReference,
            false,
          ),
          'subjects': safeGet(
            () => snapshot.data['subjects'].toList(),
          ),
          'contact_number': snapshot.data['contact_number'],
          'methodic': snapshot.data['methodic'],
          'forWho': snapshot.data['forWho'],
          'why': snapshot.data['why'],
        },
        CoursesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CoursesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'courses',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? industry,
  String? businessName,
  DateTime? startDate,
  String? title,
  String? description,
  String? duration,
  DateTime? createdAt,
  String? email,
  String? photoUrl,
  DateTime? createdTime,
  DateTime? endDate,
  String? cost,
  DocumentReference? author,
  String? contactNumber,
  String? methodic,
  String? forWho,
  String? why,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'industry': industry,
      'business_name': businessName,
      'start_date': startDate,
      'title': title,
      'description': description,
      'duration': duration,
      'created_at': createdAt,
      'email': email,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'end_date': endDate,
      'cost': cost,
      'author': author,
      'contact_number': contactNumber,
      'methodic': methodic,
      'forWho': forWho,
      'why': why,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.industry == e2?.industry &&
        e1?.businessName == e2?.businessName &&
        e1?.startDate == e2?.startDate &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.duration == e2?.duration &&
        e1?.createdAt == e2?.createdAt &&
        e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.endDate == e2?.endDate &&
        e1?.cost == e2?.cost &&
        e1?.author == e2?.author &&
        listEquality.equals(e1?.subjects, e2?.subjects) &&
        e1?.contactNumber == e2?.contactNumber &&
        e1?.methodic == e2?.methodic &&
        e1?.forWho == e2?.forWho &&
        e1?.why == e2?.why;
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.industry,
        e?.businessName,
        e?.startDate,
        e?.title,
        e?.description,
        e?.duration,
        e?.createdAt,
        e?.email,
        e?.photoUrl,
        e?.createdTime,
        e?.endDate,
        e?.cost,
        e?.author,
        e?.subjects,
        e?.contactNumber,
        e?.methodic,
        e?.forWho,
        e?.why
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
