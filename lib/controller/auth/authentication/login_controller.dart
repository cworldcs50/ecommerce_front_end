import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/services/services.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/constants/app_routes_names.dart';
import '../../../core/constants/enums/request_status.dart';
import '../../../data/datasource/remote/auth/sign_in_data.dart';
import '../../../data/model/user_model.dart';

abstract class LoginController extends GetxController {
  Future<void> login();
  Future<void> goToSignUp();
  Future<void> goToHomeView();
  String? validateInputs(String? password);
  Future<void> goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  RequestStatus? requestStatus;
  late final SignInData signInData;
  late final GlobalKey<FormState> formKey;
  late final SharedPreferences sharedPrefs;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    sharedPrefs = Get.find<Services>().prefs;
    signInData = SignInData(api: Get.find<Services>().api);
    super.onInit();
  }

  @override
  Future<void> login() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;
      update();

      final dynamic result = await signInData.userSignIn(
        emailController.text,
        passwordController.text,
      );

      requestStatus = handlingData(result);

      if (requestStatus == RequestStatus.success) {
        if (result['status'] == 'success') {
          await Future.wait([
            sharedPrefs.setBool("isUserSignedIn", true),
            UserModel.fromJson(result["data"]).toSharedPrefs(),
            goToHomeView(),
          ]);
        } else {
          requestStatus = null;
          update();
          await Get.defaultDialog(title: "67".tr, middleText: "69".tr);
        }
      } else {
        update();
        await Future.delayed(const Duration(seconds: 5), () {
          requestStatus = null;
          update();
        });
      }
    }
  }

  @override
  Future<void> goToSignUp() async => await Get.offNamed(AppRoutesNames.kSignUp);

  @override
  goToForgetPassword() async =>
      await Get.offNamed(AppRoutesNames.kForgetPassword);

  @override
  Future<void> goToHomeView() async =>
      await Get.offAllNamed(AppRoutesNames.kHome);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  @override
  String? validateInputs(String? password) =>
      password != null && password.isNotEmpty ? null : "70";
}
