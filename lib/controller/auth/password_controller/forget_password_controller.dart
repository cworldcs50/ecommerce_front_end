import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_routes_names.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  forgetPassword();
  Future<void> goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController emailController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  checkEmail() async {
    if (formKey.currentState!.validate()) {
      await goToVerifyCode();
    }
  }

  @override
  goToVerifyCode() async => await Get.offNamed(AppRoutesNames.kVerifyCode);

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  @override
  forgetPassword() {}
}
