import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';
import '../../../widget/auth/custom_auth_button.dart';
import '../../../../controller/auth/password_controller/success_reset_password_controller.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final SuccessResetPasswordControllerImp controller =
        Get.find<SuccessResetPasswordControllerImp>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        title: Text("43".tr, style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Icon(
              Icons.check_circle_outline,
              color: AppColor.primaryColorDark,
              size: 250,
            ),
            Text(
              "44".tr,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 20),
            ),
            Text(
              "45".tr,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 18),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomAuthButton(
                onPressed: controller.goToSignIn,
                text: "19".tr,
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
