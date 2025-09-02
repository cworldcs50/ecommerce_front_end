import '../../../../../core/class/api.dart';
import '../../../../../core/constants/app_api_links.dart';

class ResetPasswordData {
  const ResetPasswordData({required this.api});

  final Api api;

  Future<dynamic> resetPassword(String userEmail, String password) async {
    final result = await api.post(AppApiLinks.kResetPassword, {
      "userEmail": userEmail,
      "userNewPassword": password,
    });

    return result.fold((l) => l, (r) => r);
  }
}
