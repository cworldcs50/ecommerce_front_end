import 'package:flutter/material.dart';
import '../../view/widget/home/custom_notification_bill.dart';
import '../../view/widget/home/custom_search_form_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.onPressedIcon,
    required this.onPressedSearch,
  });

  final String title;
  final void Function() onPressedIcon;
  final void Function() onPressedSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: CustomSearchFormField(
              title: title,
              onPressedSearch: onPressedSearch,
            ),
          ),
          CustomNotificationBill(onPressed: onPressedIcon),
        ],
      ),
    );
  }
}
