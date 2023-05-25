import 'package:flutter/material.dart';

import '../components/dashboard/dashboardHistory.dart';
import '../components/dashboard/dashboardProfile.dart';
import '../components/profile/userProfile.dart';
import '../components/footer.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/paintedbg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  SizedBox(height: 20),
                  UserProfile(),
                  SizedBox(height: 10),
                  ProfileBody(),
                  SizedBox(height: 20),
                  HistoryBody(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Footer(index: 1),
        ),
      ],
    );
  }
}
