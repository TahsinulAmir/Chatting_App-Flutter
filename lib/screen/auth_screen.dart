import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widget/form_auth.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  // Function
  void submitFormFn(
    String username,
    String email,
    String password,
    bool isLogin,
  ) async {
    try {
      if (isLogin) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      }
      // tambah "on FirebaseAuthException"
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: FormAuth(submitForm: submitFormFn),
    );
  }
}
