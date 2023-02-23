import 'package:cloud_firestore/cloud_firestore.dart';
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
        final result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        // Menyimpan akun ke database firebase
        FirebaseFirestore.instance
            .collection('users')
            .doc(result.user!.uid)
            .set({
          'username': username,
          'email': email,
        });
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
