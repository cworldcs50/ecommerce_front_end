import 'package:get/get.dart';
import '../core/services/services.dart';
import '../data/model/categories_model.dart';
import '../core/functions/handling_data.dart';
import '../core/constants/enums/request_status.dart';
import '../data/datasource/remote/home/home_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeController extends GetxController {
  Future<void> getCategories();
  Future<void> initialData();
}

class HomeControllerImp extends HomeController {
  late final int id;
  late final String username;
  RequestStatus? requestStatus;
  List<CategoriesModel> categories = [];
  final SharedPreferences sharedPrefs = Get.find<Services>().prefs;
  final HomeData _homeData = HomeData(api: Get.find<Services>().api);

  @override
  Future<void> onInit() async {
    super.onInit();
    await initialData();
  }

  @override
  Future<void> initialData() async {
    username = sharedPrefs.getString("user_name")!;
    id = sharedPrefs.getInt("user_id")!;
  }

  @override
  Future<void> getCategories() async {
    requestStatus = RequestStatus.loading;
    update();

    final response = await _homeData.getCategories();

    requestStatus = handlingData(response);

    if (requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        if (response["categories"]["status"] == "success") {
          requestStatus = null;
          categories =
              (response["categories"] as List)
                  .map((category) => CategoriesModel.fromJson(category))
                  .toList();
          update();
        } else {
          //i think in this case i will try to add something
        }
      } else {
        update();
        await Future.delayed(const Duration(seconds: 5), () {
          requestStatus = null;
          update();
        });
      }
    }
  }
}
