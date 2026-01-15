import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';
import '../../../widget/auth/custom_text_form_field.dart';
import '../../../widget/auth/custom_text_title.dart';
import '../../../widget/auth/custom_auth_button.dart';
import '../../../widget/auth/custom_subtitle_text.dart';
import '../../../../controller/auth/password_controller/reset_password_controller.dart';
import '../../../../controller/auth/password_controller/hide_or_show_password_controller.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("38".tr, style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),

      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) {
            return Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  CustomTextTitle(title: "40".tr),
                  const SizedBox(height: 15),
                  CustomSubtitleText(subtitle: "41".tr),
                  const SizedBox(height: 30),
                  GetBuilder<HideOrShowPasswordControllerImp>(
                    tag: "password",
                    builder: (c) {
                      return CustomTextFormField(
                        hintText: "17".tr,
                        labelText: "16".tr,
                        icon: c.passwordIcon,
                        obsecureText: c.isObsecuredText,
                        onPressed: c.hideOrShowPassword,
                        validator: controller.passwordchecker,
                        controller: controller.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  GetBuilder<HideOrShowPasswordControllerImp>(
                    tag: "confirmedPassword",
                    builder: (c) {
                      return CustomTextFormField(
                        hintText: "39".tr,
                        labelText: "39".tr,
                        icon: c.passwordIcon,
                        obsecureText: c.isObsecuredText,
                        onPressed: c.hideOrShowPassword,
                        keyboardType: TextInputType.visiblePassword,
                        validator: controller.confirmedPasswordChecker,
                        controller: controller.confirmedPasswordController,
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  CustomAuthButton(
                    text: "42".tr,
                    onPressed: controller.resetPassword,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
