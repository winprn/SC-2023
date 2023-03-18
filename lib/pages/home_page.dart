import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sc_app/components/LoginForm.dart';
import 'package:sc_app/components/RegisterForm.dart';
import 'package:sc_app/constants.dart';
import 'package:sc_app/pages/main_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String formType = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MainPage();
            }
            return LoginForm();
          },
        ));
  }
}
