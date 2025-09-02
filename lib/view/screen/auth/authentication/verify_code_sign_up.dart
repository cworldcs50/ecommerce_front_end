import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';
import '../../../widget/auth/custom_text_title.dart';
import '../../../widget/auth/custom_subtitle_text.dart';
import '../../../../core/class/request_handler_view.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../controller/auth/verification_code/verify_code_sign_up.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("33".tr, style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundColor,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: GetBuilder<VerifyCodeSignUpImp>(
          builder: (controller) {
            return RequestHandlerView(
              status: controller.requestStatus,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  CustomTextTitle(title: "32".tr),
                  const SizedBox(height: 15),
                  CustomSubtitleText(
                    subtitle: "${"35".tr}\n${controller.userGmail}",
                  ),
                  const SizedBox(height: 30),
                  OtpTextField(
                    fieldWidth: 50,
                    numberOfFields: 5,
                    showFieldAsBox: true,
                    borderColor: const Color(0xFF512DA8),
                    borderRadius: BorderRadius.circular(10),
                    onSubmit:
                        (String verificationCode) async =>
                            await controller.checkCode(verificationCode),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
