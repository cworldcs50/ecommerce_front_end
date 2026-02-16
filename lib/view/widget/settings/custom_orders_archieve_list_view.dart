import 'custom_order_card.dart';
import 'package:flutter/material.dart';
import '../../../data/model/order_model.dart';

class CustomOrdersArchieveListView extends StatelessWidget {
  const CustomOrdersArchieveListView({super.key, required this.orders});

  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 30),
      itemBuilder:
          (context, index) => CustomOrderCard(orderModel: orders[index]),
    );
  }
}

