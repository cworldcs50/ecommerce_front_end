import '../../../../../core/class/api.dart';
import '../../../../../core/constants/app_api_links.dart';

class ForgetPasswordVerificationCodeData {
  const ForgetPasswordVerificationCodeData({required this.api});

  final Api api;

  Future<dynamic> checkCode(String email, String userVerficationCode) async {
    final result = await api.post(AppApiLinks.kForgetPasswordVerificationCode, {
      "userEmail": email,
      "userVerficationCode": userVerficationCode,
    });

    return result.fold((l) => l, (r) => r);
  }
}
