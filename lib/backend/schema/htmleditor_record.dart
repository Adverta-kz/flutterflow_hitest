import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HtmleditorRecord extends FirestoreRecord {
  HtmleditorRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "htmltext" field.
  String? _htmltext;
  String get htmltext => _htmltext ?? '';
  bool hasHtmltext() => _htmltext != null;

  // "newsref" field.
  DocumentReference? _newsref;
  DocumentReference? get newsref => _newsref;
  bool hasNewsref() => _newsref != null;

  void _initializeFields() {
    _htmltext = snapshotData['htmltext'] as String?;
    _newsref = snapshotData['newsref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('htmleditor');

  static Stream<HtmleditorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HtmleditorRecord.fromSnapshot(s));

  static Future<HtmleditorRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HtmleditorRecord.fromSnapshot(s));

  static HtmleditorRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HtmleditorRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HtmleditorRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HtmleditorRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HtmleditorRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HtmleditorRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHtmleditorRecordData({
  String? htmltext,
  DocumentReference? newsref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'htmltext': htmltext,
      'newsref': newsref,
    }.withoutNulls,
  );

  return firestoreData;
}

class HtmleditorRecordDocumentEquality implements Equality<HtmleditorRecord> {
  const HtmleditorRecordDocumentEquality();

  @override
  bool equals(HtmleditorRecord? e1, HtmleditorRecord? e2) {
    return e1?.htmltext == e2?.htmltext && e1?.newsref == e2?.newsref;
  }

  @override
  int hash(HtmleditorRecord? e) =>
      const ListEquality().hash([e?.htmltext, e?.newsref]);

  @override
  bool isValidKey(Object? o) => o is HtmleditorRecord;
}
