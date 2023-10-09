import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkAbroadRecord extends FirestoreRecord {
  WorkAbroadRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "jobTitle" field.
  String? _jobTitle;
  String get jobTitle => _jobTitle ?? '';
  bool hasJobTitle() => _jobTitle != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "pay" field.
  String? _pay;
  String get pay => _pay ?? '';
  bool hasPay() => _pay != null;

  void _initializeFields() {
    _jobTitle = snapshotData['jobTitle'] as String?;
    _description = snapshotData['description'] as String?;
    _country = snapshotData['country'] as String?;
    _city = snapshotData['city'] as String?;
    _photo = snapshotData['photo'] as String?;
    _author = snapshotData['author'] as DocumentReference?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _pay = snapshotData['pay'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('work_abroad');

  static Stream<WorkAbroadRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkAbroadRecord.fromSnapshot(s));

  static Future<WorkAbroadRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkAbroadRecord.fromSnapshot(s));

  static WorkAbroadRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkAbroadRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkAbroadRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkAbroadRecord._(reference, mapFromFirestore(data));

  static WorkAbroadRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      WorkAbroadRecord.getDocumentFromData(
        {
          'jobTitle': snapshot.data['jobTitle'],
          'description': snapshot.data['description'],
          'country': snapshot.data['country'],
          'city': snapshot.data['city'],
          'photo': snapshot.data['photo'],
          'author': convertAlgoliaParam(
            snapshot.data['author'],
            ParamType.DocumentReference,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'pay': snapshot.data['pay'],
        },
        WorkAbroadRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<WorkAbroadRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'work_abroad',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'WorkAbroadRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkAbroadRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkAbroadRecordData({
  String? jobTitle,
  String? description,
  String? country,
  String? city,
  String? photo,
  DocumentReference? author,
  String? phoneNumber,
  String? pay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'jobTitle': jobTitle,
      'description': description,
      'country': country,
      'city': city,
      'photo': photo,
      'author': author,
      'phone_number': phoneNumber,
      'pay': pay,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkAbroadRecordDocumentEquality implements Equality<WorkAbroadRecord> {
  const WorkAbroadRecordDocumentEquality();

  @override
  bool equals(WorkAbroadRecord? e1, WorkAbroadRecord? e2) {
    return e1?.jobTitle == e2?.jobTitle &&
        e1?.description == e2?.description &&
        e1?.country == e2?.country &&
        e1?.city == e2?.city &&
        e1?.photo == e2?.photo &&
        e1?.author == e2?.author &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.pay == e2?.pay;
  }

  @override
  int hash(WorkAbroadRecord? e) => const ListEquality().hash([
        e?.jobTitle,
        e?.description,
        e?.country,
        e?.city,
        e?.photo,
        e?.author,
        e?.phoneNumber,
        e?.pay
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkAbroadRecord;
}
