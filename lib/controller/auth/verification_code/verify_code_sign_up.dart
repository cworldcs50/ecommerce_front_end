import 'package:get/get.dart';
import '../../../core/services/services.dart';
import '../../../core/functions/handling_data.dart';
import '../../../core/constants/app_routes_names.dart';
import '../../../core/constants/enums/request_status.dart';
import '../../../data/datasource/remote/auth/verfication_code/verification_code_data.dart';

abstract class VerifyCodeSignUp extends GetxController {
  Future<void> checkCode(String verificationCode);
  Future<void> resendVerificationCode();
}

class VerifyCodeSignUpImp extends VerifyCodeSignUp {
  late final String userGmail;
  RequestStatus? requestStatus;
  late final VerificationCodeData verificationCodeData;

  @override
  void onInit() {
    userGmail = (Get.arguments as Map<String, dynamic>)['email'];
    verificationCodeData = VerificationCodeData(api: Get.find<Services>().api);
    super.onInit();
  }

  @override
  Future<void> checkCode(String verificationCode) async {
    requestStatus = RequestStatus.loading;
    update();

    final result = await verificationCodeData.isCorrectVerificationCode(
      userGmail,
      verificationCode,
    );

    requestStatus = handlingData(result);

    if (requestStatus == RequestStatus.success) {
      if (result["status"] == "success") {
        await Get.offNamed(AppRoutesNames.kSuccessSignUp);
      } else {
        requestStatus = null;
        update();
        await Get.defaultDialog(title: "67".tr, middleText: "66".tr);
      }
    } else {
      update();
      await Future.delayed(const Duration(seconds: 5), () {
        requestStatus = null;
        update();
      });
    }
  }

  @override
  Future<void> resendVerificationCode() async {
    requestStatus = RequestStatus.loading;
    update();

    final result = await verificationCodeData.resendVerificationCodeData(
      userGmail,
    );

    requestStatus = handlingData(result);

    if (requestStatus == RequestStatus.success) {
      if (result["status"] == "success") {
        requestStatus = null;
        update();
        Get.rawSnackbar(title: "✔", message: "90".tr);
      } else {
        requestStatus = null;
        update();
        await Get.defaultDialog(title: "67".tr, middleText: "66".tr);
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
