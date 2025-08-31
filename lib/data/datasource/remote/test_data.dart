import 'package:dartz/dartz.dart';
import '../../../core/class/api.dart';
import '../../../core/constants/app_api_links.dart';


class TestData {
  const TestData({required this.api});

  final Api api;

  dynamic getData() async {
    var response = await api.post(AppApiLinks.kTest, {});

    return response.fold((l) => Left(l), (r) => Right(r));
  }
}
