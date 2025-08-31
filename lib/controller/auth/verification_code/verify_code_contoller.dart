import 'package:get/get.dart';
import '../../../core/constants/app_routes_names.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  Future<void> goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifyCode;

  @override
  checkCode() {}

  @override
  goToResetPassword() async =>
      await Get.offNamed(AppRoutesNames.kResetPassword);
}
