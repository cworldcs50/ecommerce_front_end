import 'package:dartz/dartz.dart';
import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';
import '../../../../core/constants/enums/request_status.dart';

class VerificationCodeData {
  const VerificationCodeData({required this.api});

  final Api api;

  Future<dynamic> isCorrectVerificationCode(
    String userEmail,
    String userVerficationCode,
  ) async {
    final Either<RequestStatus, Map<dynamic, dynamic>> result = await api.post(
      AppApiLinks.kVerificationCode,
      {"userEmail": userEmail, "userVerficationCode": userVerficationCode},
    );

    return result.fold((l) => l, (r) => r);
  }
}
