import 'package:calendar_app/signin_page.dart';
import 'package:calendar_app/signup_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isSignUp = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _isSignUp
            ? Signup_Page(onTap: _toggleSignUp)
            : SignIn_Page(onTap: _toggleSignUp));
  }

  @override
  void initState() {
    super.initState();
    _isSignUp = false;
  }

  void _toggleSignUp() {
    setState(() {
      _isSignUp = !_isSignUp;
    });
  }
}
