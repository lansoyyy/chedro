import 'package:chedro/screens/home_screen.dart';
import 'package:chedro/widgets/button_widget.dart';
import 'package:chedro/widgets/text_widget.dart';
import 'package:chedro/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
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
}
