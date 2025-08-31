import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';
import '../../../widget/auth/custom_text_title.dart';
import '../../../widget/auth/custom_subtitle_text.dart';
import '../../../../controller/auth/verification_code/verify_code_contoller.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VerifyCodeControllerImp>();

    return Scaffold(
      appBar: AppBar(
        title: Text("33".tr, style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundColor,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            CustomTextTitle(title: "32".tr),
            const SizedBox(height: 15),
            CustomSubtitleText(subtitle: "35".tr),
            const SizedBox(height: 30),
            OtpTextField(
              fieldWidth: 50,
              numberOfFields: 5,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              borderColor: const Color(0xFF512DA8),
              borderRadius: BorderRadius.circular(10),
              onSubmit: (String verificationCode) async {
                await controller.goToResetPassword();
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
