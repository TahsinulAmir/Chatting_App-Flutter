import 'package:chatting_app/screen/auth_screen.dart';
import 'package:chatting_app/screen/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main(List<String> args) async {
  // membaca firebase
  WidgetsFlutterBinding.ensureInitialized();
  // initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Mereturn user
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Jika ada akunnya/sudah login
          if (snapshot.data != null) {
            // maka akan mereturn
            return ChatScreen();
          }
          // jika tidak ada...maka akan mereturn
          return AuthScreen();
        },
      ),
    );
  }
}
