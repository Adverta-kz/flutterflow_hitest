import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromotionsRecord extends FirestoreRecord {
  PromotionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "end_date" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  bool hasEndDate() => _endDate != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _photo = snapshotData['photo'] as String?;
    _endDate = snapshotData['end_date'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promotions');

  static Stream<PromotionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromotionsRecord.fromSnapshot(s));

  static Future<PromotionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromotionsRecord.fromSnapshot(s));

  static PromotionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromotionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromotionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromotionsRecord._(reference, mapFromFirestore(data));

  static PromotionsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PromotionsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'description': snapshot.data['description'],
          'photo': snapshot.data['photo'],
          'end_date': snapshot.data['end_date'],
        },
        PromotionsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PromotionsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'promotions',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PromotionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PromotionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPromotionsRecordData({
  String? name,
  String? description,
  String? photo,
  String? endDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'photo': photo,
      'end_date': endDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class PromotionsRecordDocumentEquality implements Equality<PromotionsRecord> {
  const PromotionsRecordDocumentEquality();

  @override
  bool equals(PromotionsRecord? e1, PromotionsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.photo == e2?.photo &&
        e1?.endDate == e2?.endDate;
  }

  @override
  int hash(PromotionsRecord? e) => const ListEquality()
      .hash([e?.name, e?.description, e?.photo, e?.endDate]);

  @override
  bool isValidKey(Object? o) => o is PromotionsRecord;
}
