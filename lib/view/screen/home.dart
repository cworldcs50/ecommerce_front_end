import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controller/home_controller.dart';
import '../../core/class/request_handler_view.dart';
import '../widget/home/custom_offer_container.dart';
import '../widget/home/custom_notification_bill.dart';
import '../widget/home/custom_search_form_field.dart';
import '../widget/home/custom_categoires_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return RequestHandlerView(
            status: controller.requestStatus,
            child: ListView(
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

                CustomCategoriesListView(categories: controller.categories),
              ],
            ),
          );
        },
      ),
    );
  }
}
