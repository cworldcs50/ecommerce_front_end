import 'package:get/get.dart';
import '../../../core/constants/app_routes_names.dart';

abstract class VerifyCodeSignUp extends GetxController {
  Future<void> goToSuccessPage();
}

class VerifyCodeSignUpImp extends VerifyCodeSignUp {
  @override
  Future<void> goToSuccessPage() async =>
      await Get.offAllNamed(AppRoutesNames.kSuccessCheckEmail);
}
