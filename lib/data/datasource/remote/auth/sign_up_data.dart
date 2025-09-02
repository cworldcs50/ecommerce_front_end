import 'package:dartz/dartz.dart';
import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';
import '../../../../core/constants/enums/request_status.dart';

class SignUpData {
  const SignUpData({required this.api});

  final Api api;

  dynamic addUser(
    String username,
    String password,
    String email,
    String phone,
  ) async {
    Either<RequestStatus, Map> response = await api.post(AppApiLinks.kSignUp, {
      "userEmail": email,
      "userPhone": phone,
      "userName": username,
      "userPassword": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
