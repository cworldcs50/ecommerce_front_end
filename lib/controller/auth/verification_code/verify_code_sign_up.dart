import 'package:get/get.dart';
import '../../../core/constants/app_routes_names.dart';

abstract class VerifyCodeSignUp extends GetxController {
  Future<void> goToSuccessPage();
}

class VerifyCodeSignUpImp extends VerifyCodeSignUp {
  late final String userGmail;

  @override
  void onInit() {
    userGmail = (Get.arguments as Map<String, dynamic>)['email'];
    super.onInit();
  }

  @override
  Future<void> goToSuccessPage() async =>
      await Get.offAllNamed(AppRoutesNames.kSuccessCheckEmail);
}
