import 'package:delivery_app/pages/bottomnav.dart';
import 'package:delivery_app/pages/myhomepage.dart';
import 'package:delivery_app/pages/signuppage.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:delivery_app/widgets/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                            Text(
                              "Login",
                              style: AppWidget.semiBoldTextStyle(),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Please enter the email";
                                } else if (value.toString().contains("@")) {
                                  return "Invalid Email";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'Poppins1'),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return "Password is so small";
                                } else if (value.toString().isEmpty) {
                                  return "Please enter the password";
                                } else {
                                  return null;
                                }
                              },
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.black,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'Poppins1'),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                                alignment: Alignment.centerRight,
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                            //   const SizedBox(height: 50),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) ;
                                _formKey.currentState!.save();
                                userLogin();
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
                                    "LOGIN",
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
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Don't have an account? Sign Up",
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

  void userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNav(),
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

