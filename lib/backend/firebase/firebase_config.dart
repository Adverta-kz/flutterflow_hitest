import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAaqDdW4cZ4iCEEf-avEEuq-zWxVxVssAM",
            authDomain: "hi-test-f8e04.firebaseapp.com",
            projectId: "hi-test-f8e04",
            storageBucket: "hi-test-f8e04.appspot.com",
            messagingSenderId: "579552749762",
            appId: "1:579552749762:web:2bed9ecead18e3cce9335b"));
  } else {
    await Firebase.initializeApp();
  }
}
