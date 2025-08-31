import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import '../../../core/constants/app_routes_names.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  saveNewPassword();
  goToSuccessPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController passwordController;
  late final TextEditingController confirmedPasswordController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    passwordController = TextEditingController();
    confirmedPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  saveNewPassword() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  goToSuccessPassword() async {
    if (formKey.currentState!.validate()) {
      await Get.offNamed(AppRoutesNames.kSuccessResetPassword);
    }
  }

  @override
  resetPassword() {
    if (formKey.currentState!.validate()) {}
  }
}
