import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';

class HomeData {
  const HomeData({required this.api});

  final Api api;

  Future<dynamic> getData() async {
    final result = await api.post(AppApiLinks.kHome, {});

    return result.fold((l) => l, (r) => r);
  }
}
