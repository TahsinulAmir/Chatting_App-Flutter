import 'package:flutter/material.dart';

import '../widget/form_auth.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  // Function
  void submitFormFn(
    String username,
    String email,
    String password,
    bool isLogin,
  ) {
    print(username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: FormAuth(submitForm: submitFormFn),
    );
  }
}
