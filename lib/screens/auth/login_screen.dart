import 'package:chedro/screens/home_screen.dart';
import 'package:chedro/screens/users/users_home_screen.dart';
import 'package:chedro/widgets/button_widget.dart';
import 'package:chedro/widgets/text_widget.dart';
import 'package:chedro/widgets/textfield_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/toast_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.blue],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 75,
                      width: 75,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                            text: 'REPUBLIC OF THE PHILIPPINES',
                            fontSize: 18,
                            fontFamily: 'Bold',
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                        TextWidget(
                          text: 'OFFICE OF THE PRESIDENT',
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'Bold',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: 'COMMISION ON HIGHER EDUCATION',
                          fontSize: 24,
                          fontFamily: 'Bold',
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: 'Login',
                          fontSize: 32,
                          color: Colors.black,
                          fontFamily: 'Bold',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          controller: emailController,
                          label: 'Email',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          isObscure: true,
                          showEye: true,
                          controller: passwordController,
                          label: 'Password',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ButtonWidget(
                          radius: 100,
                          label: 'Login',
                          onPressed: () {
                            if (emailController.text == 'admin-email' &&
                                passwordController.text == 'admin-password') {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            } else {
                              login(context);
                            }
                          },
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  login(context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      showToast('Logged in succesfully!');

      await FirebaseFirestore.instance
          .collection('Users')
          .where('email', isEqualTo: emailController.text)
          .get()
          .then((value) {
        if (value.docs.first['role'] == 'Administrator') {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const UsersHomeScreen()));
        }
      });
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const UsersHomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast("No user found with that email.");
      } else if (e.code == 'wrong-password') {
        showToast("Wrong password provided for that user.");
      } else if (e.code == 'invalid-email') {
        showToast("Invalid email provided.");
      } else if (e.code == 'user-disabled') {
        showToast("User account has been disabled.");
      } else {
        showToast("An error occurred: ${e.message}");
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
