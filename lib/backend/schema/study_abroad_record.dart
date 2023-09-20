import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudyAbroadRecord extends FirestoreRecord {
  StudyAbroadRecord._(
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

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "educationalInstitution" field.
  String? _educationalInstitution;
  String get educationalInstitution => _educationalInstitution ?? '';
  bool hasEducationalInstitution() => _educationalInstitution != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  bool hasContact() => _contact != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _country = snapshotData['country'] as String?;
    _city = snapshotData['city'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _educationalInstitution = snapshotData['educationalInstitution'] as String?;
    _author = snapshotData['author'] as DocumentReference?;
    _photo = snapshotData['photo'] as String?;
    _contact = snapshotData['contact'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('study_abroad');

  static Stream<StudyAbroadRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudyAbroadRecord.fromSnapshot(s));

  static Future<StudyAbroadRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudyAbroadRecord.fromSnapshot(s));

  static StudyAbroadRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudyAbroadRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudyAbroadRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudyAbroadRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudyAbroadRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudyAbroadRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudyAbroadRecordData({
  String? name,
  String? description,
  String? country,
  String? city,
  double? price,
  String? educationalInstitution,
  DocumentReference? author,
  String? photo,
  String? contact,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'country': country,
      'city': city,
      'price': price,
      'educationalInstitution': educationalInstitution,
      'author': author,
      'photo': photo,
      'contact': contact,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudyAbroadRecordDocumentEquality implements Equality<StudyAbroadRecord> {
  const StudyAbroadRecordDocumentEquality();

  @override
  bool equals(StudyAbroadRecord? e1, StudyAbroadRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.country == e2?.country &&
        e1?.city == e2?.city &&
        e1?.price == e2?.price &&
        e1?.educationalInstitution == e2?.educationalInstitution &&
        e1?.author == e2?.author &&
        e1?.photo == e2?.photo &&
        e1?.contact == e2?.contact;
  }

  @override
  int hash(StudyAbroadRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.country,
        e?.city,
        e?.price,
        e?.educationalInstitution,
        e?.author,
        e?.photo,
        e?.contact
      ]);

  @override
  bool isValidKey(Object? o) => o is StudyAbroadRecord;
}
