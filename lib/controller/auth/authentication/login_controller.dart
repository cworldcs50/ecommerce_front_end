import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_routes_names.dart';

abstract class LoginController extends GetxController {
  login();
  Future<void> goToSignUp();
  Future<void> goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  login() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Future<void> goToSignUp() async => await Get.offNamed(AppRoutesNames.kSignUp);

  @override
  goToForgetPassword() async =>
      await Get.offNamed(AppRoutesNames.kForgetPassword);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

}
