import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../widget/auth/logo_auth.dart';
import '../../../../core/constants/app_color.dart';
import '../../../widget/auth/custom_text_title.dart';
import '../../../widget/auth/custom_auth_button.dart';
import '../../../widget/auth/custom_sign_up_text.dart';
import '../../../widget/auth/custom_subtitle_text.dart';
import '../../../../core/functions/alert_exit_app.dart';
import '../../../../core/class/request_handler_view.dart';
import '../../../widget/auth/custom_text_form_field.dart';
import '../../../widget/auth/forget_password_button.dart';
import '../../../../controller/auth/authentication/login_controller.dart';
import '../../../../controller/auth/password_controller/hide_or_show_password_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text("11".tr, style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) {
          return RequestHandlerView(
            status: controller.requestStatus,
            // ignore: deprecated_member_use
            child: WillPopScope(
              onWillPop: alertExitApp,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    children: [
                      const LogoAuth(),
                      CustomTextTitle(title: "12".tr),
                      const SizedBox(height: 15),
                      CustomSubtitleText(subtitle: "13".tr),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator:
                            (email) => controller.validateInputs(email)?.tr,
                        labelText: "14".tr,
                        hintText: "15".tr,
                        icon: Icons.email_outlined,
                        controller: controller.emailController,
                      ),
                      const SizedBox(height: 25),
                      GetBuilder<HideOrShowPasswordControllerImp>(
                        tag: "login",
                        builder: (c) {
                          return CustomTextFormField(
                            obsecureText: c.isObsecuredText,
                            onPressed: c.hideOrShowPassword,
                            keyboardType: TextInputType.visiblePassword,
                            validator:
                                (password) =>
                                    controller.validateInputs(password)?.tr,

                            labelText: "16".tr,
                            hintText: "17".tr,
                            icon: c.passwordIcon,
                            controller: controller.passwordController,
                          );
                        },
                      ),
                      ForgetPasswordButton(
                        onTap: controller.goToForgetPassword,
                      ),
                      const SizedBox(height: 20),
                      CustomAuthButton(
                        text: "19".tr,
                        onPressed: controller.login,
                      ),
                      const SizedBox(height: 30),
                      CustomSignUpOrSignInText(
                        text: "20".tr,
                        btnName: "21".tr,
                        onTap: controller.goToSignUp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
