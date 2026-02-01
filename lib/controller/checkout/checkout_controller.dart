import 'package:get/get.dart';
import '../../data/model/address_model.dart';
import '../address/address_view_controller.dart';

class CheckoutController extends GetxController {
  int choosedAddress = -1;
  int deliveryTypeIndex = 3;
  int paymentMethodIndex = 3;
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

  Future<void> checkout() async {}

  void getAddressIndex(AddressModel addressModel) {
    choosedAddress = addressViewController.addresses.indexOf(addressModel);
    update();
  }

  @override
  void onInit() {
    super.onInit();
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
