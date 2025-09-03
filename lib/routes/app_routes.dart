import 'package:get/get.dart';
import '../view/screen/auth/authentication/success_sign_up.dart';
import '../view/screen/home.dart';
import '../view/screen/test/test.dart';
import '../view/screen/language.dart';
import 'package:flutter/cupertino.dart';
import '../view/screen/test/test_data_view.dart';
import '../view/screen/auth/on_boarding.dart';
import 'middlewares/language_middleware.dart';
import '../core/constants/app_routes_names.dart';
import 'middlewares/on_boarding_middleware.dart';
import '../view/screen/auth/email/check_email.dart';
import '../view/screen/auth/authentication/login.dart';
import '../view/screen/auth/password/forget_password_verify_code.dart';
import '../view/screen/auth/authentication/sign_up.dart';
import '../view/screen/auth/password/reset_password.dart';
import '../view/screen/auth/password/forget_password.dart';
import '../view/screen/auth/email/success_check_email.dart';
import '../view/screen/auth/authentication/verify_code_sign_up.dart';
import '../view/screen/auth/password/success_reset_password.dart';
import 'middlewares/sign_in_middleware.dart';

final List<GetPage<Widget>> appPages = [
  GetPage<TestDataView>(
    name: AppRoutesNames.kTestData,
    page: () => const TestDataView(),
  ),
  GetPage<Test>(name: AppRoutesNames.kText, page: () => const Test()),
  GetPage<VerifyCodeSignUp>(
    name: AppRoutesNames.kVerifyCodeSignUp,
    page: () => const VerifyCodeSignUp(),
  ),
  GetPage<SuccessCheckEmail>(
    name: AppRoutesNames.kSuccessCheckEmail,
    page: () => const SuccessCheckEmail(),
  ),
  GetPage<CheckEmail>(
    name: AppRoutesNames.kCheckEmail,
    page: () => const CheckEmail(),
  ),
  GetPage<SuccessResetPassword>(
    name: AppRoutesNames.kSuccessResetPassword,
    page: () => const SuccessResetPassword(),
  ),
  GetPage<Test>(name: AppRoutesNames.kText, page: () => const Test()),
  GetPage<Language>(
    name: AppRoutesNames.kLanguage,
    page: () => const Language(),
    middlewares: [LanguageMiddleware()],
  ),
  GetPage<OnBoarding>(
    name: AppRoutesNames.kOnBoarding,
    page: () => const OnBoarding(),
    middlewares: [OnBoardingMiddleware()],
  ),
  GetPage<Login>(
    name: AppRoutesNames.kLogin,
    page: () => const Login(),
    middlewares: [SignInMiddleware()],
  ),
  GetPage<SignUp>(name: AppRoutesNames.kSignUp, page: () => const SignUp()),
  GetPage<ForgetPassword>(
    name: AppRoutesNames.kForgetPassword,
    page: () => const ForgetPassword(),
  ),
  GetPage<ForgetPasswordVerifyCode>(
    name: AppRoutesNames.kForgetPasswordVerifyCode,
    page: () => const ForgetPasswordVerifyCode(),
  ),
  GetPage<ResetPassword>(
    name: AppRoutesNames.kResetPassword,
    page: () => const ResetPassword(),
  ),

  GetPage<SuccessSignUp>(
    name: AppRoutesNames.kSuccessSignUp,
    page: () => const SuccessSignUp(),
  ),
  GetPage(name: AppRoutesNames.kHome, page: () => const HomeView()),
];
