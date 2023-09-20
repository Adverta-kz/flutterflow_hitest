import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TutorsRecord extends FirestoreRecord {
  TutorsRecord._(
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

  // "subjects" field.
  List<String>? _subjects;
  List<String> get subjects => _subjects ?? const [];
  bool hasSubjects() => _subjects != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "format" field.
  String? _format;
  String get format => _format ?? '';
  bool hasFormat() => _format != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "for_who" field.
  String? _forWho;
  String get forWho => _forWho ?? '';
  bool hasForWho() => _forWho != null;

  // "refUsersTutor" field.
  List<DocumentReference>? _refUsersTutor;
  List<DocumentReference> get refUsersTutor => _refUsersTutor ?? const [];
  bool hasRefUsersTutor() => _refUsersTutor != null;

  // "contactNumber" field.
  String? _contactNumber;
  String get contactNumber => _contactNumber ?? '';
  bool hasContactNumber() => _contactNumber != null;

  // "priceForOneLesson" field.
  String? _priceForOneLesson;
  String get priceForOneLesson => _priceForOneLesson ?? '';
  bool hasPriceForOneLesson() => _priceForOneLesson != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _subjects = getDataList(snapshotData['subjects']);
    _duration = castToType<int>(snapshotData['duration']);
    _format = snapshotData['format'] as String?;
    _photo = snapshotData['photo'] as String?;
    _author = snapshotData['author'] as DocumentReference?;
    _forWho = snapshotData['for_who'] as String?;
    _refUsersTutor = getDataList(snapshotData['refUsersTutor']);
    _contactNumber = snapshotData['contactNumber'] as String?;
    _priceForOneLesson = snapshotData['priceForOneLesson'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tutors');

  static Stream<TutorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TutorsRecord.fromSnapshot(s));

  static Future<TutorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TutorsRecord.fromSnapshot(s));

  static TutorsRecord fromSnapshot(DocumentSnapshot snapshot) => TutorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TutorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TutorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TutorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TutorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTutorsRecordData({
  String? name,
  String? description,
  int? duration,
  String? format,
  String? photo,
  DocumentReference? author,
  String? forWho,
  String? contactNumber,
  String? priceForOneLesson,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'duration': duration,
      'format': format,
      'photo': photo,
      'author': author,
      'for_who': forWho,
      'contactNumber': contactNumber,
      'priceForOneLesson': priceForOneLesson,
    }.withoutNulls,
  );

  return firestoreData;
}

class TutorsRecordDocumentEquality implements Equality<TutorsRecord> {
  const TutorsRecordDocumentEquality();

  @override
  bool equals(TutorsRecord? e1, TutorsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.subjects, e2?.subjects) &&
        e1?.duration == e2?.duration &&
        e1?.format == e2?.format &&
        e1?.photo == e2?.photo &&
        e1?.author == e2?.author &&
        e1?.forWho == e2?.forWho &&
        listEquality.equals(e1?.refUsersTutor, e2?.refUsersTutor) &&
        e1?.contactNumber == e2?.contactNumber &&
        e1?.priceForOneLesson == e2?.priceForOneLesson;
  }

  @override
  int hash(TutorsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.subjects,
        e?.duration,
        e?.format,
        e?.photo,
        e?.author,
        e?.forWho,
        e?.refUsersTutor,
        e?.contactNumber,
        e?.priceForOneLesson
      ]);

  @override
  bool isValidKey(Object? o) => o is TutorsRecord;
}
