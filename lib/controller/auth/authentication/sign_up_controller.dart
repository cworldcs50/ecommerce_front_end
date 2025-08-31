import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_routes_names.dart';

abstract class SignUpController extends GetxController {
  Future<void> signUp();
  Future<void> goToSignIn();
  Future<void> goToCheckEmail();
  Future<void> goToVerifyCodeSignUp();
}

class SignUpControllerImp extends SignUpController {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      await goToVerifyCodeSignUp();
    }
  }

  @override
  Future<void> goToVerifyCodeSignUp() async =>
      await Get.offNamed(AppRoutesNames.kVerifyCodeSignUp);

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  @override
  Future<void> goToCheckEmail() async =>
      await Get.offNamed(AppRoutesNames.kCheckEmail);

  @override
  Future<void> goToSignIn() async => await Get.offNamed(AppRoutesNames.kLogin);
}
