import 'package:admin_aplication/screens/auth/sign_in_page.dart';
import 'package:admin_aplication/screens/auth/sign_up_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogged = true;

  @override
  Widget build(BuildContext context) {
    return isLogged
        ? SignInPage(onClickSignUp: switchAuthPages)
        : SignUpPage(onClickedSignIn: switchAuthPages);
  }

  void switchAuthPages() => setState(() {
        isLogged = !isLogged;
      });
}
