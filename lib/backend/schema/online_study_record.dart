import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnlineStudyRecord extends FirestoreRecord {
  OnlineStudyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "methodology" field.
  String? _methodology;
  String get methodology => _methodology ?? '';
  bool hasMethodology() => _methodology != null;

  // "why" field.
  String? _why;
  String get why => _why ?? '';
  bool hasWhy() => _why != null;

  // "forWho" field.
  String? _forWho;
  String get forWho => _forWho ?? '';
  bool hasForWho() => _forWho != null;

  // "school" field.
  DocumentReference? _school;
  DocumentReference? get school => _school;
  bool hasSchool() => _school != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "userRef" field.
  List<DocumentReference>? _userRef;
  List<DocumentReference> get userRef => _userRef ?? const [];
  bool hasUserRef() => _userRef != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "buisness_name" field.
  String? _buisnessName;
  String get buisnessName => _buisnessName ?? '';
  bool hasBuisnessName() => _buisnessName != null;

  // "subjects" field.
  List<String>? _subjects;
  List<String> get subjects => _subjects ?? const [];
  bool hasSubjects() => _subjects != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _methodology = snapshotData['methodology'] as String?;
    _why = snapshotData['why'] as String?;
    _forWho = snapshotData['forWho'] as String?;
    _school = snapshotData['school'] as DocumentReference?;
    _phone = snapshotData['phone'] as String?;
    _userRef = getDataList(snapshotData['userRef']);
    _author = snapshotData['author'] as DocumentReference?;
    _photo = snapshotData['photo'] as String?;
    _buisnessName = snapshotData['buisness_name'] as String?;
    _subjects = getDataList(snapshotData['subjects']);
    _price = snapshotData['price'] as String?;
    _created = snapshotData['created'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('online_study');

  static Stream<OnlineStudyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OnlineStudyRecord.fromSnapshot(s));

  static Future<OnlineStudyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OnlineStudyRecord.fromSnapshot(s));

  static OnlineStudyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OnlineStudyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OnlineStudyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OnlineStudyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OnlineStudyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OnlineStudyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOnlineStudyRecordData({
  String? title,
  String? description,
  String? methodology,
  String? why,
  String? forWho,
  DocumentReference? school,
  String? phone,
  DocumentReference? author,
  String? photo,
  String? buisnessName,
  String? price,
  DateTime? created,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'methodology': methodology,
      'why': why,
      'forWho': forWho,
      'school': school,
      'phone': phone,
      'author': author,
      'photo': photo,
      'buisness_name': buisnessName,
      'price': price,
      'created': created,
    }.withoutNulls,
  );

  return firestoreData;
}

class OnlineStudyRecordDocumentEquality implements Equality<OnlineStudyRecord> {
  const OnlineStudyRecordDocumentEquality();

  @override
  bool equals(OnlineStudyRecord? e1, OnlineStudyRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.methodology == e2?.methodology &&
        e1?.why == e2?.why &&
        e1?.forWho == e2?.forWho &&
        e1?.school == e2?.school &&
        e1?.phone == e2?.phone &&
        listEquality.equals(e1?.userRef, e2?.userRef) &&
        e1?.author == e2?.author &&
        e1?.photo == e2?.photo &&
        e1?.buisnessName == e2?.buisnessName &&
        listEquality.equals(e1?.subjects, e2?.subjects) &&
        e1?.price == e2?.price &&
        e1?.created == e2?.created;
  }

  @override
  int hash(OnlineStudyRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.methodology,
        e?.why,
        e?.forWho,
        e?.school,
        e?.phone,
        e?.userRef,
        e?.author,
        e?.photo,
        e?.buisnessName,
        e?.subjects,
        e?.price,
        e?.created
      ]);

  @override
  bool isValidKey(Object? o) => o is OnlineStudyRecord;
}
