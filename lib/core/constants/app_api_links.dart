class AppApiLinks {
  static const String kBaseUrl =
      "localhost";
  static const String kTest = "$kBaseUrl/test.php";
  static const String kSignUp = "$kBaseUrl/auth/sign_up.php";
  static const String kSignin = "$kBaseUrl/auth/sign_in.php";
  static const String kCheckEmail = "$kBaseUrl/forget_password/check_email.php";
  static const String kVerificationCode = "$kBaseUrl/auth/verfication_code.php";
  static const String kForgetPasswordVerificationCode =
      "$kBaseUrl/forget_password/forget_password_verification_code.php";
  static const String kResetPassword =
      "$kBaseUrl/forget_password/reset_password.php";
  static const String kHome = "$kBaseUrl/home.php";
  static const String kBaseImageUrl = "$kBaseUrl/upload";
  static const String kItemsImages = "$kBaseImageUrl/items";
  static const String kCategoiresImages = "$kBaseImageUrl/categories";
}
