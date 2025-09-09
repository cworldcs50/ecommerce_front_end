import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';
import '../../../widget/auth/custom_auth_button.dart';
import '../../../../controller/auth/email_controller/success_check_email_controller.dart';

class SuccessCheckEmail extends StatelessWidget {
  const SuccessCheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final SuccessCheckEmailControllerImp successCheckEmailController =
        Get.find<SuccessCheckEmailControllerImp>();

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
              "46".tr,
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
                onPressed: successCheckEmailController.goToSignIn,
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
