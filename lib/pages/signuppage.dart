import 'dart:math';

import 'package:delivery_app/pages/bottomnav.dart';
import 'package:delivery_app/pages/loginpage.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widgets/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 1,
                color: Colors.deepOrange.shade700,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                margin: const EdgeInsets.only(top: 250),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 1,
              ),
              Container(
                margin: const EdgeInsets.only(top: 50, right: 20, left: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Center(
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 10, bottom: 20),
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height / 2.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Sign Up",
                                style: AppWidget.semiBoldTextStyle(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Please enter the name";
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: "Name",
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                hintStyle: TextStyle(
                                    fontSize: 18, fontFamily: 'Poppins1'),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter E-mail';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintStyle: TextStyle(
                                    fontSize: 18, fontFamily: 'Poppins1'),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.black,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    fontSize: 18, fontFamily: 'Poppins1'),
                              ),
                            ),

                            //   const SizedBox(height: 50),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  signUp();
                                }
                              },
                              child: Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange.shade700,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Already have an account? Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp() async {
    try {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      // emailController.clear();
      // nameController.clear();
      // passwordController.clear();

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
      }).onError((error, stackTrace) {
        debugPrint(error.toString());
        Utils().flutterToast(error.toString());
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      Utils().flutterToast(e.toString());
    }
  }
}
