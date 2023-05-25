import 'package:carservice/components/customizedButton.dart';
import 'package:carservice/components/customizedText.dart';
import 'package:carservice/pages/forgotPassword.dart';
import 'package:carservice/pages/dashboard.dart';
import 'package:flutter/material.dart';

import '../models/password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Model model = Model(password: '');

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 6) {
      return 'Username must be at least 6 characters long';
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    return null; // Return null if the value is valid
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/wave.png'), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: CustomizedText(
                  text: 'Login',
                  size: 40,
                  weight: FontWeight.bold,
                  color: Colors.teal),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(100, 47, 118, 101),
                      blurRadius: 20,
                      offset: Offset(0, 10))
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.grey)),
                          validator: validateUsername),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          _formKey.currentState!.save();
                          return null;
                        },
                        onSaved: (String? value) {
                          model.password = value!;
                          return;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ForgotPassword();
                      },
                    ),
                  );
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 18, color: Colors.teal),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: CustomizedButton(
                  weight: FontWeight.normal,
                  fontsize: 18,
                  text: 'Login',
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DashBoard();
                          },
                        ),
                      );
                    }
                  },
                  color: Colors.teal,
                  textcolor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
