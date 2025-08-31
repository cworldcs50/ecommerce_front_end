import 'dart:developer';
import 'package:flutter/material.dart';
import '../../core/functions/check_internet_connectivity.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Test", style: TextStyle(fontSize: 25)),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            OtpTextField(
              fieldWidth: 50,
              numberOfFields: 5,
              showFieldAsBox: true,

              borderColor: const Color(0xFF512DA8),
              borderRadius: BorderRadius.circular(10),
              onSubmit: (String verificationCode) async {
                bool res = await checkInternetConnectivity();
                log("$res");
                showDialog(
                  // ignore: use_build_context_synchronously
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
