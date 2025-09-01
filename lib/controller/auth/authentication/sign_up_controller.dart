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
  // List data = [];
  late RequestStatus requestStatus;
  late final SignUpData signUpData;
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
    signUpData = SignUpData(api: Get.find<Services>().api);
    requestStatus = RequestStatus.loading;
    super.onInit();
  }

  @override
  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      final dynamic result = await signUpData.addUser(
        usernameController.text,
        passwordController.text,
        emailController.text,
        phoneController.text,
      );

      requestStatus = handlingData(result);

      if (requestStatus == RequestStatus.success) {
        if (result['status'] == 'success') {
          // data.add(result["status"]);
          await goToVerifyCodeSignUp();
        } else {
          await Get.defaultDialog(title: "64".tr, middleText: "65".tr);
          requestStatus = RequestStatus.failure;
        }
      }
    }
  }

  @override
  Future<void> goToVerifyCodeSignUp() async => await Get.offNamed(
    AppRoutesNames.kVerifyCodeSignUp,
    arguments: {"email": emailController.text},
  );

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
