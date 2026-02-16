import 'package:get/get.dart';
import '../../core/constants/enums/request_status.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../data/model/order_model.dart';
import '../../data/datasource/remote/orders/orders_archieve_data.dart';

class OrdersArchieveController extends GetxController {
  late final Services _services;
  late final OrdersArchieveData _ordersArchieveData;
  late List<OrderModel> orders;
  RequestStatus? requestStatus;

  @override
  Future<void> onInit() async {
    super.onInit();
    initData();
    await getOrdersArchieve();
  }

  void initData() {
    orders = [];
    _services = Get.find<Services>();
    _ordersArchieveData = OrdersArchieveData(api: _services.api);
  }

  Future<void> getOrdersArchieve() async {
    requestStatus = RequestStatus.loading;
    update();
    final response = await _ordersArchieveData.getOrders(
      _services.prefs.getInt("user_id")!.toString(),
    );

    final result = handlingData(response);

    if (RequestStatus.success == result) {
      if ("success" == response["status"]) {
        orders =
            (response["data"] as List)
                .map((order) => OrderModel.fromJson(order))
                .toList();
        requestStatus = null;
      } else {
        requestStatus = RequestStatus.noData;
      }
    } else {
      requestStatus = RequestStatus.serverFailure;
    }

    update();

    await Future.delayed(const Duration(seconds: 2), () {
      requestStatus = null;
      update();
    });
  }
}
