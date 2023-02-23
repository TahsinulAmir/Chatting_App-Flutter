import 'package:flutter/material.dart';

class FormAuth extends StatefulWidget {
  const FormAuth({super.key});

  @override
  State<FormAuth> createState() => _FormAuthState();
}

class _FormAuthState extends State<FormAuth> {
  @override
  Widget build(BuildContext context) {
    bool isLogin = false;
    final _formKey = GlobalKey<FormState>();
    String _username = '';
    String _email = '';
    String _password = '';

    void _trySubmit() {
      bool isValid = _formKey.currentState!.validate();

      if (isValid) {
        // akan menjalankan property onSave
        _formKey.currentState!.save();
        print(_username);
      }
    }

    return SingleChildScrollView(
      child: Center(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 200, horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    onSaved: ((value) {
                      // _username diatas akan diisi dengan value
                      _username = value!;
                    }),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return "Username minimal 4 karakter";
                      }
                    },
                    decoration: InputDecoration(
                      label: Text("Username"),
                    ),
                  ),
                  TextFormField(
                    onSaved: ((value) {
                      // _email diatas akan diisi dengan value
                      _email = value!;
                    }),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return "Email tidak valid";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text("Email"),
                    ),
                  ),
                  TextFormField(
                    onSaved: ((value) {
                      // _password diatas akan diisi dengan value
                      _password = value!;
                    }),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return "Password minimal 6 karakter";
                      }
                    },
                    obscureText: true,
                    // keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      label: Text("Password"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _trySubmit();
                    },
                    child: Text("Login"),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        // false => true, sebaliknya
                        isLogin = !isLogin;
                      });
                    },
                    child: Text("Create Account"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
