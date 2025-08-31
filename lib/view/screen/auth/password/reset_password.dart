import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';
import '../../../widget/auth/custom_text_title.dart';
import '../../../widget/auth/custom_auth_button.dart';
import '../../../widget/auth/custom_subtitle_text.dart';
import '../../../../core/functions/validate_input.dart';
import '../../../../core/constants/enums/input_type.dart';
import '../../../widget/auth/custom_text_form_field.dart';
import '../../../../controller/auth/password_controller/reset_password_controller.dart';
import '../../../../controller/auth/password_controller/hide_or_show_password_controller.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResetPasswordControllerImp>();

    return Scaffold(
      appBar: AppBar(
        title: Text("38".tr, style: Theme.of(context).textTheme.headlineSmall),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundColor,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              CustomTextTitle(title: "40".tr),
              const SizedBox(height: 15),
              CustomSubtitleText(subtitle: "41".tr),
              const SizedBox(height: 30),
              GetBuilder<HideOrShowPasswordControllerImp>(
                builder: (c) {
                  return CustomTextFormField(
                    obsecureText: c.isObsecuredText,
                    onPressed: c.hideOrShowPassword,
                    keyboardType: TextInputType.visiblePassword,
                    validator:
                        (password) =>
                            validateInput(
                              password!,
                              8,
                              32,
                              InputType.password,
                            )?.tr,
                    labelText: "16".tr,
                    hintText: "17".tr,
                    icon: c.passwordIcon,
                    controller: controller.passwordController,
                  );
                },
              ),
              const SizedBox(height: 40),
              GetBuilder<HideOrShowPasswordControllerImp>(
                builder: (c) {
                  return CustomTextFormField(
                    obsecureText: c.isObsecuredText,
                    onPressed: c.hideOrShowPassword,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (confirmedPassword) {
                      if (controller.passwordController.text !=
                          controller.confirmedPasswordController.text) {
                        return "58".tr;
                      }
                      return null;
                    },
                    labelText: "39".tr,
                    hintText: "39".tr,
                    icon: c.passwordIcon,
                    controller: controller.confirmedPasswordController,
                  );
                },
              ),
              const SizedBox(height: 40),
              CustomAuthButton(
                text: "42".tr,
                onPressed: () async {
                  await controller.saveNewPassword();
                  await controller.goToSuccessPassword();
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
