// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future deleteAllExceptNew(
    DocumentReference quizRef, DocumentReference userRef) async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('quizResult');

  // Запрос для получения всех записей с определенными quizRef и userRef
  QuerySnapshot querySnapshot = await collectionReference
      .where('quizRef', isEqualTo: quizRef)
      .where('userRef', isEqualTo: userRef)
      .orderBy('timestamp', descending: true) // Сортировка по временной метке
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    List<DocumentSnapshot> documents = querySnapshot.docs;
    if (documents.length > 1) {
      // Получение всех документов, кроме самого нового
      List<DocumentSnapshot> docsToDelete = documents.sublist(1);

      // Удаление всех документов, кроме самого нового
      await Future.wait(docsToDelete.map((document) {
        return document.reference.delete();
      }));
    }
  }
}
