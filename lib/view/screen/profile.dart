import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(child: Text("Profile")),
    );
  }
}
