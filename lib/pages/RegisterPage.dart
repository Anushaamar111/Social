import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/components.dart/my_Buttton.dart';
import 'package:todo_app/components.dart/textfield.dart';
import 'package:todo_app/helper.dart/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController usernamecontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController confirmpasswordcontroller =
      TextEditingController();

  void registerUser() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    //make sure passwords match
    if (passwordcontroller.text != confirmpasswordcontroller.text) {
      Navigator.pop(context);
      messageToUser('Wrong Password', context);
    } else {
      //try creating the user
      try {
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailcontroller.text, password: passwordcontroller.text);

        //create new user document and add to firestore
        createUserDocument(userCredential);
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        messageToUser(e.code, context);
      }
    }
  }

  //creates a user document and upload to firestore
  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection('User')
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': usernamecontroller.text
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt_outlined,
                size: 49,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'S O C I A L',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              MyTextField(
                  hintText: "Username",
                  obscureText: false,
                  controller: usernamecontroller),
              const SizedBox(
                height: 18,
              ),
              MyTextField(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailcontroller),
              const SizedBox(
                height: 18,
              ),
              MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordcontroller),
              const SizedBox(
                height: 18,
              ),
              MyTextField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: confirmpasswordcontroller),
              const SizedBox(
                height: 18,
              ),
              MyButton(text: 'Register', onTap: registerUser),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: GestureDetector(
                  onTap: widget.onTap,
                  child: const Row(
                    children: [
                      Text("Already have an account? \t"),
                      Text(
                        'Login here ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
