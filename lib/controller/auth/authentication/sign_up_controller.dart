import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/services/services.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/constants/app_routes_names.dart';
import '../../../core/constants/enums/request_status.dart';
import '../../../data/datasource/remote/auth/sign_up_data.dart';

abstract class SignUpController extends GetxController {
  Future<void> signUp();
  Future<void> goToSignIn();
  Future<void> goToCheckEmail();
  Future<void> goToVerifyCodeSignUp();
}

class SignUpControllerImp extends SignUpController {
  RequestStatus? requestStatus;
  late final SignUpData signUpData;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;

  @override
  void onInit() {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    signUpData = SignUpData(api: Get.find<Services>().api);
    super.onInit();
  }

  @override
  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;
      update();

      final dynamic result = await signUpData.addUser(
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      requestStatus = handlingData(result);

      if (requestStatus == RequestStatus.success) {
        if (result['status'] == 'success') {
          await goToVerifyCodeSignUp();
          requestStatus = null;
          update();
        } else {
          requestStatus = null;
          update();
          await Get.defaultDialog(title: "64".tr, middleText: "65".tr);
        }
      } else {
        update();
        await Future.delayed(const Duration(seconds: 5), () {
          requestStatus = null;
          update();
        });
        await Get.defaultDialog(title: "64".tr, middleText: "65".tr);
      }
    }
  }

  @override
  Future<void> goToVerifyCodeSignUp() async => await Get.offNamed(
    AppRoutesNames.kVerifyCodeSignUp,
    arguments: {"email": emailController.text.trim()},
  );

  @override
  void onClose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.onClose();
  }

  @override
  Future<void> goToCheckEmail() async =>
      await Get.toNamed(AppRoutesNames.kCheckEmail);

  @override
  Future<void> goToSignIn() async =>
      await Get.offAllNamed(AppRoutesNames.kLogin);
}
