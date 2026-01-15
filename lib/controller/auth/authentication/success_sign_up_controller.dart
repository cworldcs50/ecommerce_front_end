import 'package:get/get.dart';
import '../../../core/constants/app_routes_names.dart';

abstract class SuccessSignUpController extends GetxController {
  Future<void> goToSignIn();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  Future<void> goToSignIn() async =>
      await Get.offAllNamed(AppRoutesNames.kLogin);
}
