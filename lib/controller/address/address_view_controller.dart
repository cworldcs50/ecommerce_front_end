import 'package:get/get.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../data/model/address_model.dart';
import '../../core/constants/enums/request_status.dart';
import '../../data/datasource/remote/address/address_data.dart';

class AddressViewController extends GetxController {
  late final int _userId;
  late final Services services;
  late List<AddressModel> addresses;
  late final AddressData addressData;
  RequestStatus? requestStatus;

  @override
  void onInit() async {
    super.onInit();
    initVars();
    await getAddresses();
  }

  Future<void> deleteAddress(String addressId) async {
    final response = await addressData.deleteAddress(addressId: addressId);
    addresses.removeWhere((element) => element.addressId == addressId);

    final RequestStatus result = handlingData(response);

    if (RequestStatus.success == result) {
      if ("success" == response["status"]) {
        Get.showSnackbar(
          const GetSnackBar(
            title: "✔",
            message: "address removed successfully!",
          ),
        );
      } else {
        Get.showSnackbar(
          const GetSnackBar(title: "⚠", message: "address not removed!"),
        );
      }
    } else {
      Get.showSnackbar(
        const GetSnackBar(title: "⚠", message: "address not removed!"),
      );
    }

    update();
    requestStatus = null;
  }

  Future<void> getAddresses() async {
    requestStatus = RequestStatus.loading;

    update();

    final response = await addressData.viewAddress("$_userId");

    final RequestStatus result = handlingData(response);
    requestStatus = result;
    update();

    if (RequestStatus.success == result) {
      if ("success" == response["status"]) {
        addresses =
            (response["data"] as List)
                .map((address) => AddressModel.fromJson(address))
                .toList();
      } else {
        requestStatus = RequestStatus.noData;
        addresses = [];
      }
    } else {
      Get.showSnackbar(const GetSnackBar(title: "⚠", message: "ErrorR!"));
    }

    update();
  }

  void initVars() {
    addresses = [];
    services = Get.find<Services>();
    addressData = AddressData(services.api);
    _userId = services.prefs.getInt("user_id")!;
  }
}
