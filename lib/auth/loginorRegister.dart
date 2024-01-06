import 'package:flutter/material.dart';
import 'package:todo_app/pages/RegisterPage.dart';
import 'package:todo_app/pages/loginPage.dart';

class loginorRegister extends StatefulWidget {
  const loginorRegister({super.key});

  @override
  State<loginorRegister> createState() => _loginorRegisterState();
}

class _loginorRegisterState extends State<loginorRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
