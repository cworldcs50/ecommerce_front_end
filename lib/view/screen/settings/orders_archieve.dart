import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/class/request_handler_view.dart';
import '../../widget/settings/custom_orders_archieve_list_view.dart';
import '../../../controller/checkout/orders_archieve_controller.dart';

class OrdersArchieve extends StatelessWidget {
  const OrdersArchieve({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.primaryColorDark),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: AppColor.primaryColorDark),
        ),
        title: const Text(
          "orders archieve",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColorDark,
          ),
        ),
      ),
      body: GetBuilder<OrdersArchieveController>(
        builder: (controller) {
          return RequestHandlerView(
            status: controller.requestStatus,
            child: CustomOrdersArchieveListView(orders: controller.orders),
          );
        },
      ),
    );
  }
}
