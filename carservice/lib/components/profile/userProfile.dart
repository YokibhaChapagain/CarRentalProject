import 'dart:ui';

import 'package:carservice/pages/forgotPassword.dart';
import 'package:flutter/material.dart';

import '../../pages/loginPage.dart';
import '../customizedText.dart';
import 'profileUpdate.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    super.key,
  });

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  void _showUserDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const ProfileUpdate(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Welcome John,',
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Gotham',
              color: Colors.teal,
            ),
          ),
          PopupMenuButton(
            color: Colors.white,
            offset: const Offset(0, 80),
            onSelected: ((value) {
              switch (value) {
                case 0:
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ForgotPassword()));
                  break;
                case 1:
                  _showUserDetails(context);
                  break;
                case 2:
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                  break;
              }
            }),
            constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width / 1.18,
                minHeight: MediaQuery.of(context).size.height / 5),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('images/profile.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'John Conte',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'johnconte@gmail.com',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: const [
                    Icon(
                      Icons.lock,
                      size: 20,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomizedText(
                      text: 'Change Password',
                      size: 15,
                      weight: FontWeight.bold,
                      color: Colors.teal,
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: const [
                    Icon(
                      Icons.settings,
                      size: 20,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomizedText(
                      text: 'Update Profile',
                      size: 15,
                      weight: FontWeight.bold,
                      color: Colors.teal,
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: const [
                    Icon(
                      Icons.logout,
                      size: 20,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomizedText(
                      text: 'Logout',
                      size: 15,
                      weight: FontWeight.bold,
                      color: Colors.teal,
                    )
                  ],
                ),
              ),
            ],
            child: Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      image: AssetImage('images/profile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
