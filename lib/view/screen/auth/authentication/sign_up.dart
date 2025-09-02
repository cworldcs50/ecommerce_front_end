import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../controller/auth/password_controller/hide_or_show_password_controller.dart';
import '../../../../core/class/request_handler_view.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/enums/input_type.dart';
import '../../../../core/functions/validate_input.dart';
import '../../../widget/auth/custom_text_title.dart';
import '../../../widget/auth/custom_auth_button.dart';
import '../../../widget/auth/custom_sign_up_text.dart';
import '../../../widget/auth/custom_subtitle_text.dart';
import '../../../widget/auth/custom_text_form_field.dart';
import '../../../../controller/auth/authentication/sign_up_controller.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text("21".tr, style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) {
            return RequestHandlerView(
              status: controller.requestStatus,
              child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    CustomTextTitle(title: "12".tr),
                    const SizedBox(height: 15),
                    CustomSubtitleText(subtitle: "23".tr),
                    const SizedBox(height: 30),
                    CustomTextFormField(
                      keyboardType: TextInputType.name,
                      validator:
                          (username) =>
                              validateInput(
                                username!,
                                5,
                                25,
                                InputType.username,
                              )?.tr,
                      controller: controller.usernameController,
                      labelText: "24".tr,
                      hintText: "25".tr,
                      icon: Icons.person_outlined,
                    ),
                    const SizedBox(height: 25),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator:
                          (email) =>
                              validateInput(
                                email!,
                                5,
                                150,
                                InputType.email,
                              )?.tr,
                      controller: controller.emailController,
                      labelText: "14".tr,
                      hintText: "15".tr,
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 25),
                    CustomTextFormField(
                      keyboardType: TextInputType.phone,
                      validator:
                          (phoneNumer) =>
                              validateInput(
                                phoneNumer!,
                                8,
                                15,
                                InputType.phoneNumber,
                              )?.tr,
                      controller: controller.phoneController,
                      labelText: "26".tr,
                      hintText: "27".tr,
                      icon: Icons.phone_android_outlined,
                    ),
                    const SizedBox(height: 25),
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
                          controller: controller.passwordController,
                          labelText: "16".tr,
                          hintText: "17".tr,
                          icon: c.passwordIcon,
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                    CustomAuthButton(
                      text: "28".tr,
                      onPressed: controller.signUp,
                    ),
                    const SizedBox(height: 30),
                    CustomSignUpOrSignInText(
                      text: "22".tr,
                      btnName: "11".tr,
                      onTap: controller.goToSignIn,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
