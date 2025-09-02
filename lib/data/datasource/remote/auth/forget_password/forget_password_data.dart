import '../../../../../core/class/api.dart';
import '../../../../../core/constants/app_api_links.dart';

class ForgetPasswordData {
  const ForgetPasswordData({required this.api});

  final Api api;

  Future<dynamic> checkEmail(String email) async {
    final result = await api.post(AppApiLinks.kCheckEmail, {
      "userEmail": email,
    });

    return result.fold((l) => l, (r) => r);
  }
}
