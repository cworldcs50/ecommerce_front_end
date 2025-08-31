import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/enums/input_type.dart';
import '../../../../core/functions/validate_input.dart';
import '../../../widget/auth/custom_text_title.dart';
import '../../../widget/auth/custom_auth_button.dart';
import '../../../widget/auth/custom_subtitle_text.dart';
import '../../../widget/auth/custom_text_form_field.dart';
import '../../../../controller/auth/password_controller/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgetPasswordControllerImp>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        title: Text("29".tr, style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              CustomTextTitle(title: "31".tr),
              const SizedBox(height: 15),
              CustomSubtitleText(subtitle: "34".tr),
              const SizedBox(height: 30),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                validator:
                    (email) =>
                        validateInput(email!, 5, 150, InputType.email)?.tr,
                hintText: "15".tr,
                labelText: "14".tr,
                icon: Icons.email_outlined,
                controller: controller.emailController,
              ),
              const SizedBox(height: 40),
              CustomAuthButton(text: "30".tr, onPressed: controller.checkEmail),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
