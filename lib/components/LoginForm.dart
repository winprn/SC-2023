import 'package:flutter/material.dart';
import 'package:sc_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = '', password = '';

  Future<void> login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 90),
      child: Container(
        padding: EdgeInsets.all(50),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color(0xFFF0EFFF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Hello,\nWelcome back",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0E2384),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'username',
                hintStyle: TextStyle(
                  color: Color(0xFFC3C5DD),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xFFC3C5DD),
                  ),
                ),
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            TextField(
              onChanged: ((value) {
                setState(() {
                  password = value;
                });
              }),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'password',
                hintStyle: TextStyle(
                  color: Color(0xFFC3C5DD),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xFFC3C5DD),
                  ),
                ),
                prefixIcon: Icon(Icons.lock_outline_rounded),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {
                login();
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Color(0xFF00105C),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  'Log In',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Color(0xFF00105C),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF00105C),
                    fontSize: 14,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
