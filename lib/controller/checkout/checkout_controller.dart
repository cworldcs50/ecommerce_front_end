import 'package:get/get.dart';
import '../../core/services/services.dart';
import '../../data/model/address_model.dart';
import '../../core/functions/handling_data.dart';
import '../address/address_view_controller.dart';
import '../../core/constants/app_routes_names.dart';
import '../../core/constants/enums/request_status.dart';
import '../../data/datasource/remote/orders/checkout_data.dart';

class CheckoutController extends GetxController {
  late final int _userId;
  int choosedAddress = -1;
  int deliveryTypeIndex = 3;
  int paymentMethodIndex = 3;
  RequestStatus? requestStatus;
  late final Services _services;
  late final CheckoutData _checkoutData;
  late final AddressViewController addressViewController;

  bool canCheckout() {
    if (deliveryTypeIndex == 0) {
      if (paymentMethodIndex < 3 && choosedAddress > -1) {
        return true;
      } else {
        return false;
      }
    } else if (deliveryTypeIndex == 1) {
      if (paymentMethodIndex < 3) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  Future<void> returnToHomeView() async =>
      await Get.offAllNamed(AppRoutesNames.kHome);

  Future<void> checkout() async {
    requestStatus = RequestStatus.loading;
    update();

    final response = await _checkoutData.checkout(
      ordersUserId: _userId,
      ordersDeliveryPrice: 20,
      couponDiscount: Get.arguments["couponDiscount"].toString(),
      ordersDeliveryType: deliveryTypeIndex,
      ordersPaymentMethod: paymentMethodIndex,
      ordersPrice: Get.arguments["ordersTotalPrice"].toString(),
      isOrdersApplyCoupon: int.parse(Get.arguments["isOrderApplyCoupon"]),
      ordersAddressId:
          choosedAddress >= 0
              ? int.parse(
                addressViewController.addresses[choosedAddress].addressId,
              )
              : 1,
    );

    final RequestStatus result = handlingData(response);

    if (result == RequestStatus.success) {
      if (response["status"] == "success") {
        Get.showSnackbar(
          GetSnackBar(title: "success!", message: "${response["message"]}!"),
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(title: "failure!", message: "${response["message"]}!"),
        );
      }
    } else {
      requestStatus = RequestStatus.serverFailure;
      update();
    }

    await Future.delayed(const Duration(seconds: 2), () {
      requestStatus = null;
      update();
    });
  }

  void getAddressIndex(AddressModel addressModel) {
    choosedAddress = addressViewController.addresses.indexOf(addressModel);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _services = Get.find<Services>();
    _checkoutData = CheckoutData(api: _services.api);
    _userId = Get.find<Services>().prefs.getInt("user_id")!;
    addressViewController = Get.find<AddressViewController>();
  }

  void cash() {
    paymentMethodIndex = 0;
    update();
  }

  void paymentCards() {
    paymentMethodIndex = 1;
    update();
  }

  void driveThru() {
    deliveryTypeIndex = 1;
    update();
  }

  void delivery() {
    deliveryTypeIndex = 0;
    update();
  }
}
