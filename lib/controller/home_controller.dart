import 'package:get/get.dart';
import '../data/model/items_model.dart';
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
  List<ItemsModel> items = [];
  final SharedPreferences sharedPrefs = Get.find<Services>().prefs;
  final HomeData _homeData = HomeData(api: Get.find<Services>().api);

  @override
  Future<void> onInit() async {
    super.onInit();
    await initialData();
    await getCategories();
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
        if (response["categories"]["status"] == "success" ||
            response["categories"]["items"] == "success") {
          requestStatus = null;

          categories =
              (response["categories"]["data"] as List)
                  .map((category) => CategoriesModel.fromJson(category))
                  .toList();

          items =
              (response["items"]["data"] as List)
                  .map((item) => ItemsModel.fromJson(item))
                  .toList();

          update();
        } else {
          requestStatus = RequestStatus.noData;
          update();
          await Future.delayed(const Duration(seconds: 5), () {
            requestStatus = null;
            update();
          });
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
