import '../../../core/class/api.dart';
import '../../../core/constants/app_api_links.dart';

class TestData {
  const TestData({required this.api});

  final Api api;

  getData() async {
    var response = await api.post(AppApiLinks.kTest, {});

    response.fold((l) {}, (r) {});
  }
}
