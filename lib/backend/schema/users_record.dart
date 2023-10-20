import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "second_name" field.
  String? _secondName;
  String get secondName => _secondName ?? '';
  bool hasSecondName() => _secondName != null;

  // "birthday" field.
  String? _birthday;
  String get birthday => _birthday ?? '';
  bool hasBirthday() => _birthday != null;

  // "balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  bool hasBalance() => _balance != null;

  // "indentificator" field.
  String? _indentificator;
  String get indentificator => _indentificator ?? '';
  bool hasIndentificator() => _indentificator != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "paiedQuizes" field.
  List<DocumentReference>? _paiedQuizes;
  List<DocumentReference> get paiedQuizes => _paiedQuizes ?? const [];
  bool hasPaiedQuizes() => _paiedQuizes != null;

  // "currentSchool" field.
  String? _currentSchool;
  String get currentSchool => _currentSchool ?? '';
  bool hasCurrentSchool() => _currentSchool != null;

  // "TeacherName" field.
  String? _teacherName;
  String get teacherName => _teacherName ?? '';
  bool hasTeacherName() => _teacherName != null;

  // "currentGrade" field.
  String? _currentGrade;
  String get currentGrade => _currentGrade ?? '';
  bool hasCurrentGrade() => _currentGrade != null;

  // "card" field.
  List<CardStruct>? _card;
  List<CardStruct> get card => _card ?? const [];
  bool hasCard() => _card != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _name = snapshotData['name'] as String?;
    _secondName = snapshotData['second_name'] as String?;
    _birthday = snapshotData['birthday'] as String?;
    _balance = castToType<double>(snapshotData['balance']);
    _indentificator = snapshotData['indentificator'] as String?;
    _role = snapshotData['role'] as String?;
    _paiedQuizes = getDataList(snapshotData['paiedQuizes']);
    _currentSchool = snapshotData['currentSchool'] as String?;
    _teacherName = snapshotData['TeacherName'] as String?;
    _currentGrade = snapshotData['currentGrade'] as String?;
    _card = getStructList(
      snapshotData['card'],
      CardStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? name,
  String? secondName,
  String? birthday,
  double? balance,
  String? indentificator,
  String? role,
  String? currentSchool,
  String? teacherName,
  String? currentGrade,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'name': name,
      'second_name': secondName,
      'birthday': birthday,
      'balance': balance,
      'indentificator': indentificator,
      'role': role,
      'currentSchool': currentSchool,
      'TeacherName': teacherName,
      'currentGrade': currentGrade,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.name == e2?.name &&
        e1?.secondName == e2?.secondName &&
        e1?.birthday == e2?.birthday &&
        e1?.balance == e2?.balance &&
        e1?.indentificator == e2?.indentificator &&
        e1?.role == e2?.role &&
        listEquality.equals(e1?.paiedQuizes, e2?.paiedQuizes) &&
        e1?.currentSchool == e2?.currentSchool &&
        e1?.teacherName == e2?.teacherName &&
        e1?.currentGrade == e2?.currentGrade &&
        listEquality.equals(e1?.card, e2?.card);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.name,
        e?.secondName,
        e?.birthday,
        e?.balance,
        e?.indentificator,
        e?.role,
        e?.paiedQuizes,
        e?.currentSchool,
        e?.teacherName,
        e?.currentGrade,
        e?.card
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
