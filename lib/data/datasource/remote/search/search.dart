import '../../../../core/class/api.dart';
import '../../../../core/constants/app_api_links.dart';

class SearchData {
  const SearchData({required this.api});

  final Api api;

  Future<dynamic> search(String searchKeywords) async {
    final result = await api.post(AppApiLinks.kSearch, {
      "searchKeywords": searchKeywords,
    });

    return result.fold((l) => l, (r) => r);
  }
}
