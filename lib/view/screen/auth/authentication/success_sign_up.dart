import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';
import '../../../widget/auth/custom_auth_button.dart';
import '../../../../controller/auth/authentication/success_sign_up_controller.dart';

class SuccessSignUp extends GetView<SuccessSignUpControllerImp> {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
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
              "68".tr,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontSize: 20),
            ),
            Text(
              "47".tr,
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
