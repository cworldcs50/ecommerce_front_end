import 'package:get/get.dart';
import '../core/services/services.dart';
import '../core/functions/handling_data.dart';
import '../data/datasource/remote/test_data.dart';
import '../core/constants/enums/request_status.dart';

class TestDataController extends GetxController {
  final TestData testData = TestData(api: Get.find<Services>().api);

  RequestStatus requestStatus = RequestStatus.loading;
  List data = [];

  Future<void> getData() async {
    final result = await testData.getData();
    requestStatus = handlingData(result);

    if (requestStatus == RequestStatus.success) {
      if (result['status'] == 'success') {
        data.addAll(result["data"]);
      } else {
        requestStatus = RequestStatus.failure;
      }
    }

    update();
  }

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }
}
