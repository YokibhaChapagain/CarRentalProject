import 'package:carservice/components/customizedButton.dart';
import 'package:carservice/pages/dashboard.dart';
import 'package:flutter/material.dart';

import '../models/password.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Model model = Model(password: '');

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
              height: 50,
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
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Create your Password",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
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
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Re-enter Password",
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please re-enter password';
                          } else if (value != model.password) {
                            return 'Password not matched';
                          }
                          return null;
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
              child: CustomizedButton(
                color: Colors.teal,
                textcolor: Colors.white,
                weight: FontWeight.normal,
                fontsize: 18,
                text: 'Confirm',
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
