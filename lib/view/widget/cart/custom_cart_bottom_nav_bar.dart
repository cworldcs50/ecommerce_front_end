import 'package:flutter/material.dart';

import '../../../core/constants/app_color.dart';
import 'custom_lang_button.dart';

class CustomCartBottomNavBar extends StatelessWidget {
  const CustomCartBottomNavBar({
    super.key,
    required this.price,
    required this.shipping,
    required this.totalPrice,
  });

  final String price, shipping, totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("price"),
              Text(
                "$price \$",
                style: const TextStyle(
                  fontFamily: "sans",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("shipping"),
              Text(
                "$shipping \$",
                style: const TextStyle(
                  fontFamily: "sans",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Divider(color: Colors.black),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Price",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColorDark,
                ),
              ),
              Text(
                "$totalPrice \$",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColorDark,
                  fontFamily: "sans",
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          CustomPlaceOrder(btnTitle: "Place Order", onPressed: () {}),
        ],
      ),
    );
  }
}
