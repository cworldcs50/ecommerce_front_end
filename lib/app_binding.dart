import 'package:get/get.dart';
import 'controller/address/address_add_details_controller.dart';
import 'controller/address/address_view_controller.dart';
import 'controller/cart/cart_controller.dart';
import 'controller/checkout/checkout_controller.dart';
import 'controller/checkout/orders_archieve_controller.dart';
import 'controller/home/home_controller.dart';
import 'controller/notifications/notifications_controller.dart';
import 'controller/test_data_controller.dart';
import 'controller/items/items_controller.dart';
import 'controller/on_boarding_controller.dart';
import 'controller/settings/settings_controller.dart';
import 'controller/items/items_details_controller.dart';
import 'controller/address/address_add_controller.dart';
import 'controller/favorites/favorites_view_controller.dart';
import 'controller/auth/authentication/login_controller.dart';
import 'controller/auth/authentication/sign_up_controller.dart';
import 'controller/auth/verification_code/verify_code_sign_up.dart';
import 'controller/favorites/add_or_remove_favorites_controller.dart';
import 'controller/auth/email_controller/check_email_controller.dart';
import 'controller/auth/authentication/success_sign_up_controller.dart';
import 'controller/auth/password_controller/reset_password_controller.dart';
import 'controller/auth/password_controller/forget_password_controller.dart';
import 'controller/auth/email_controller/success_check_email_controller.dart';
import 'controller/auth/password_controller/hide_or_show_password_controller.dart';
import 'controller/auth/password_controller/success_reset_password_controller.dart';
import 'controller/auth/verification_code/forget_password_verify_code_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessSignUpControllerImp>(
      () => SuccessSignUpControllerImp(),
      fenix: true,
    );

    Get.lazyPut<TestDataController>(() => TestDataController(), fenix: true);

    Get.lazyPut<LoginControllerImp>(() => LoginControllerImp(), fenix: true);

    Get.lazyPut<SignUpControllerImp>(() => SignUpControllerImp(), fenix: true);

    Get.lazyPut<CheckEmailControllerImp>(
      () => CheckEmailControllerImp(),
      fenix: true,
    );

    Get.lazyPut<SuccessCheckEmailControllerImp>(
      () => SuccessCheckEmailControllerImp(),
      fenix: true,
    );

    Get.lazyPut<ForgetPasswordControllerImp>(
      () => ForgetPasswordControllerImp(),
      fenix: true,
    );

    Get.lazyPut<ResetPasswordControllerImp>(
      () => ResetPasswordControllerImp(),
      fenix: true,
    );

    Get.lazyPut<SuccessResetPasswordControllerImp>(
      () => SuccessResetPasswordControllerImp(),
      fenix: true,
    );

    Get.lazyPut<VerifyCodeSignUpImp>(() => VerifyCodeSignUpImp(), fenix: true);

    Get.lazyPut<ForgetPasswordVerifyCodeControllerImp>(
      () => ForgetPasswordVerifyCodeControllerImp(),
      fenix: true,
    );

    Get.lazyPut<OnBoardingControllerImp>(
      () => OnBoardingControllerImp(),
      fenix: true,
    );

    Get.lazyPut(
      () => HideOrShowPasswordControllerImp(),
      tag: "password",
      fenix: true,
    );

    Get.lazyPut(
      () => HideOrShowPasswordControllerImp(),
      tag: "confirmedPassword",
      fenix: true,
    );

    Get.lazyPut(
      () => HideOrShowPasswordControllerImp(),
      tag: "signUpPassword",
      fenix: true,
    );

    Get.lazyPut(
      () => HideOrShowPasswordControllerImp(),
      tag: "login",
      fenix: true,
    );
    Get.lazyPut(() => HomeControllerImp(), fenix: true);
    Get.lazyPut(() => ItemsControllerImp(), fenix: true);
    Get.lazyPut(() => ItemsDetailsControllerImp(), fenix: true);
    Get.lazyPut(() => AddOrRemoveFavoritesControllerImp(), fenix: true);
    Get.lazyPut(() => FavoritesViewControllerImp(), fenix: true);
    Get.lazyPut(() => SettingsControllerImp(), fenix: true);
    Get.lazyPut(() => CartControllerImp(), fenix: true);
    Get.lazyPut(() => AddressAddController(), fenix: true);
    Get.lazyPut(() => AddressAddDetailsController(), fenix: true);
    Get.lazyPut(() => AddressViewController(), fenix: true);
    Get.lazyPut(() => CheckoutController(), fenix: true);
    Get.lazyPut(() => OrdersArchieveController(), fenix: true);
    Get.lazyPut(() => NotificationsController(), fenix: true);
  }
}
