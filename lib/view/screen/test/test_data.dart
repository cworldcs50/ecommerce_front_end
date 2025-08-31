import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/test_data_controller.dart';
import '../../../core/constants/enums/request_status.dart';

class TestData extends StatelessWidget {
  const TestData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Data"), centerTitle: true),
      body: GetBuilder<TestDataController>(
        builder: (controller) {
          switch (controller.requestStatus) {
            case RequestStatus.loading:
              return const Center(child: Text("Loading"));
            case RequestStatus.offlineFailure:
              return const Center(child: Text("You are offline"));
            case RequestStatus.success:
              return ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => Text("${controller.data}"),
              );
            case RequestStatus.serverFailure:
              return const Center(
                child: Text(
                  "Oops! there is an error try again later! server failuer",
                ),
              );
            case RequestStatus.failure:
              return const Center(
                child: Text("Oops! there is an error try again later! failuer"),
              );
          }
        },
      ),
    );
  }
}
