import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/class/request_handler_view.dart';
import '../../../core/constants/app_routes_names.dart';
import '../../widget/address/custom_address_card.dart';
import '../../../controller/address/address_view_controller.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primaryColorDark,
        title: Text("96".tr, style: const TextStyle(color: Colors.white)),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColor.primaryColorDark,
        onPressed: () async => await Get.toNamed(AppRoutesNames.kAddressAdd),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: GetBuilder<AddressViewController>(
        builder:
            (controller) => RequestHandlerView(
              status: controller.requestStatus,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.separated(
                  itemCount: controller.addresses.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 30),
                  itemBuilder:
                      (context, index) => CustomAddressCard(
                        delete:
                            () async => await controller.deleteAddress(
                              controller.addresses[index].addressId,
                            ),
                        addressModel: controller.addresses[index],
                      ),
                ),
              ),
            ),
      ),
    );
  }
}
