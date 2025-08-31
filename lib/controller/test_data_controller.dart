import 'package:get/get.dart';
import '../core/constants/enums/request_status.dart';
import '../core/functions/handling_data.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/test_data.dart';

class TestDataController extends GetxController {
  final TestData testData = TestData(api: Get.find<Services>().api);

  RequestStatus requestStatus = RequestStatus.loading;
  List data = [];

  Future<void> getData() async {
    final result = await testData.getData();
    final RequestStatus resultStatus = handlingData(result);

    if (resultStatus == RequestStatus.success) {
      data.addAll(result["data"]);
    } else {
      requestStatus = resultStatus;
    }

    update();
  }

  @override
  void onInit() async {
    await getData();
    super.onInit();
  }
}
