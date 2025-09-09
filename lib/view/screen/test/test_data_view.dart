import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/class/test_data_handler_view.dart';
import '../../../controller/test_data_controller.dart';
import '../../../core/constants/app_color.dart';

class TestDataView extends StatelessWidget {
  const TestDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Data"),
        centerTitle: true,
        backgroundColor: AppColor.primaryColorDark,
      ),
      body: GetBuilder<TestDataController>(
        builder:
            (controller) => TestDataHandlerView(
              requestStatus: controller.requestStatus,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => Text("${controller.data}"),
              ),
            ),
      ),
    );
  }
}
