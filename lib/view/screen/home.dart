import 'package:flutter/material.dart';
import '../widget/home/custom_offer_container.dart';
import '../widget/home/custom_notification_bill.dart';
import '../widget/home/custom_search_form_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Row(
              spacing: 10,
              children: [
                Expanded(child: CustomSearchFormField()),
                CustomNotificationBill(),
              ],
            ),
          ),
          const CustomOfferContainer(),
        ],
      ),
    );
  }
}
