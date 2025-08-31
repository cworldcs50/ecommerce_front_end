import 'package:get/get.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/test_data.dart';

class TestDataController extends GetxController {
  final TestData testData = TestData(api: Get.find<Services>().api);

}
