import 'package:get/get.dart';

class CheckoutController extends GetxController {
  int deliveryTypeIndex = 3;
  int  paymentMethodIndex = 3;

  void cash(){ 
    paymentMethodIndex = 0;
    update();
  }

  void paymentCards(){ 
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
