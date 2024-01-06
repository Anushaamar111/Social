import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/auth/authPage.dart';
import 'package:todo_app/auth/loginorRegister.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/pages/HomePage.dart';
import 'package:todo_app/pages/User.dart';
import 'package:todo_app/pages/profile_page.dart';
import 'package:todo_app/theme/dark-mode.dart';
import 'package:todo_app/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: darkMode,
      darkTheme: lightMode,
      routes: {
        '/loginorRegister': (context) => loginorRegister(),
        '/HomePage': (context) => HomePage(),
        '/profile_page': (context) => profile_page(),
        '/User': (context) => UserList(),
      },
    );
  }
}
