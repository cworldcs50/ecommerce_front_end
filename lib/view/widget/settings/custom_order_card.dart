import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import '../../../data/model/order_model.dart';
import '../../../core/constants/app_color.dart';

class CustomOrderCard extends StatelessWidget {
  const CustomOrderCard({required this.orderModel, super.key});

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Order Number: ${orderModel.ordersId}"),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color:
                        orderModel.ordersStatus == 0
                            ? Colors.pink
                            : orderModel.ordersStatus == 1
                            ? Colors.deepOrangeAccent
                            : orderModel.ordersStatus == 2
                            ? Colors.blueGrey
                            : orderModel.ordersStatus == 3
                            ? Colors.green
                            : Colors.red,
                  ),
                  child: Text(
                    orderModel.ordersStatus == 0
                        ? "pending"
                        : orderModel.ordersStatus == 1
                        ? "prepared"
                        : orderModel.ordersStatus == 2
                        ? "on the way"
                        : orderModel.ordersStatus == 3
                        ? "completed"
                        : "cancelled",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 3),
            Text(
              "Order Type : ${orderModel.ordersDeliveryType == 0 ? "Delivery" : "Drive Thru"}",
            ),
            Text("Order Price : ${orderModel.ordersPrice}\$"),
            Text("Delivery Price: ${orderModel.ordersDeliveryPrice}\$"),
            Text(
              "Payment Method : ${orderModel.ordersPaymentMethod == 0 ? "Cash" : "Payment Cards"}",
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                Jiffy.parse(orderModel.ordersCreationTime.toString()).fromNow(),
                style: const TextStyle(color: AppColor.primaryColorDark),
              ),
            ),
            const Divider(thickness: 3),
            Row(
              children: [
                Text(
                  "Total Price: ${orderModel.ordersPrice}\$",
                  style: const TextStyle(
                    color: AppColor.primaryColorDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    foregroundColor: Colors.white,
                    backgroundColor: AppColor.primaryColorDark,
                  ),
                  child: const Text("Details"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
