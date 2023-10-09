import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TournamentsRecord extends FirestoreRecord {
  TournamentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "participants" field.
  List<DocumentReference>? _participants;
  List<DocumentReference> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "subjects" field.
  List<String>? _subjects;
  List<String> get subjects => _subjects ?? const [];
  bool hasSubjects() => _subjects != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "specification" field.
  String? _specification;
  String get specification => _specification ?? '';
  bool hasSpecification() => _specification != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _participants = getDataList(snapshotData['participants']);
    _duration = snapshotData['duration'] as String?;
    _description = snapshotData['description'] as String?;
    _subjects = getDataList(snapshotData['subjects']);
    _createdDate = snapshotData['created_date'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _specification = snapshotData['specification'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tournaments');

  static Stream<TournamentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TournamentsRecord.fromSnapshot(s));

  static Future<TournamentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TournamentsRecord.fromSnapshot(s));

  static TournamentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TournamentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TournamentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TournamentsRecord._(reference, mapFromFirestore(data));

  static TournamentsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TournamentsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'participants': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['participants'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'duration': snapshot.data['duration'],
          'description': snapshot.data['description'],
          'subjects': safeGet(
            () => snapshot.data['subjects'].toList(),
          ),
          'created_date': convertAlgoliaParam(
            snapshot.data['created_date'],
            ParamType.DateTime,
            false,
          ),
          'created_by': convertAlgoliaParam(
            snapshot.data['created_by'],
            ParamType.DocumentReference,
            false,
          ),
          'specification': snapshot.data['specification'],
        },
        TournamentsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TournamentsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'tournaments',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'TournamentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TournamentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTournamentsRecordData({
  String? name,
  String? duration,
  String? description,
  DateTime? createdDate,
  DocumentReference? createdBy,
  String? specification,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'duration': duration,
      'description': description,
      'created_date': createdDate,
      'created_by': createdBy,
      'specification': specification,
    }.withoutNulls,
  );

  return firestoreData;
}

class TournamentsRecordDocumentEquality implements Equality<TournamentsRecord> {
  const TournamentsRecordDocumentEquality();

  @override
  bool equals(TournamentsRecord? e1, TournamentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        listEquality.equals(e1?.participants, e2?.participants) &&
        e1?.duration == e2?.duration &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.subjects, e2?.subjects) &&
        e1?.createdDate == e2?.createdDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.specification == e2?.specification;
  }

  @override
  int hash(TournamentsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.participants,
        e?.duration,
        e?.description,
        e?.subjects,
        e?.createdDate,
        e?.createdBy,
        e?.specification
      ]);

  @override
  bool isValidKey(Object? o) => o is TournamentsRecord;
}
