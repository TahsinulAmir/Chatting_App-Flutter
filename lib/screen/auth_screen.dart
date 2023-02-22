import 'package:flutter/material.dart';

import '../widget/form_auth.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: FormAuth(),
    );
  }
}
