import 'package:chedro/screens/auth/login_screen.dart';
import 'package:chedro/screens/tabs/letter_head_tab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          authDomain: 'chedro-1e773.firebaseapp.com',
          apiKey: "AIzaSyAYcs7EynvpHBhTrZ5xOB3_WqO0eyoYnnA",
          appId: "1:322630743242:web:9062aa64a6471b4e457033",
          messagingSenderId: "322630743242",
          projectId: "chedro-1e773",
          storageBucket: "chedro-1e773.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CHEDRO',
      home: LetterheadTab(),
    );
  }
}
