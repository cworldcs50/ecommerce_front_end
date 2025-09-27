import 'package:flutter/material.dart';
import '../../view/widget/home/custom_notification_bill.dart';
import '../../view/widget/home/custom_search_form_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        spacing: 10,
        children: [
          Expanded(child: CustomSearchFormField(title: title)),
          const CustomNotificationBill(),
        ],
      ),
    );
  }
}
