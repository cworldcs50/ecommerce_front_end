import 'package:dartz/dartz.dart';
import '../../../core/class/api.dart';
import '../../../core/constants/app_api_links.dart';
import '../../../core/constants/enums/request_status.dart';

class TestData {
  const TestData({required this.api});

  final Api api;

  dynamic getData() async {
    Either<RequestStatus, Map> response = await api.post(AppApiLinks.kTest, {});

    return response.fold((l) => l, (r) => r);
  }
}
