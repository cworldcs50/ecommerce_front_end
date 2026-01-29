import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_routes_names.dart';
import '../../core/constants/enums/request_status.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address/address_data.dart';

class AddressAddDetailsController extends GetxController {
  late final int _userId;
  RequestStatus? requestStatus;
  late final Services services;
  late final AddressData addressData;
  late final GlobalKey<FormState> formKey;
  late final TextEditingController nameController;
  late final TextEditingController cityController;
  late final TextEditingController streetController;

  @override
  void onInit() {
    super.onInit();
    initVars();
  }

  void initVars() {
    services = Get.find<Services>();
    _userId = services.prefs.getInt("user_id")!;
    addressData = AddressData(services.api);
    formKey = GlobalKey<FormState>();
    cityController = TextEditingController();
    nameController = TextEditingController();
    streetController = TextEditingController();
  }

  String? addressDetailsValidator(String? cityName, String fieldName) {
    if (cityName == null) {
      return "mandatory";
    }
    if (cityName.isEmpty) {
      return "enter your $fieldName name";
    }

    return null;
  }

  Future<void> addAddressDetails() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;

      update();

      final response = await addressData.addAddress(
        addressUserId: "$_userId",
        name: nameController.text,
        addressCity: cityController.text,
        addressStreet: streetController.text,
        addressLat: "${Get.arguments["lat"]}",
        addressLong: "${Get.arguments["long"]}",
      );

      final RequestStatus result = handlingData(response);
      requestStatus = result;

      update();

      if (RequestStatus.success == result) {
        if ("success" == response["status"]) {
          Get.showSnackbar(
            const GetSnackBar(
              title: "✔",
              message: "Address Added Successfully!",
            ),
          );
          await Get.offAllNamed(AppRoutesNames.kHome);
        } else {
          Get.showSnackbar(const GetSnackBar(title: "⚠", message: "Error!"));
        }
      } else {
        Get.showSnackbar(
          const GetSnackBar(title: "⚠", message: "Server Error Try Again!"),
        );
      }

      update();

      await Future.delayed(const Duration(seconds: 2), () {
        requestStatus = null;
        update();
      });
    }
  }
}
