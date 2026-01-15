import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/shared/custom_app_bar.dart';
import '../../widget/home/custom_section_title.dart';
import '../../../core/class/request_handler_view.dart';
import '../../widget/home/custom_items_list_view.dart';
import '../../widget/home/custom_offer_container.dart';
import '../../widget/home/custom_offer_list_view.dart';
import '../../widget/home/custom_categoires_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: RequestHandlerView(
            status: controller.requestStatus,
            child: ListView(
              children: [
                CustomAppBar(
                  title: "75".tr,
                  onPressedIcon: () {},
                  onPressedSearch: () {},
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  height: 200,
                  child: CustomOfferListView(
                    offerContainers: [
                      CustomOfferContainer(
                        onTap: () {},
                        subTitle: "Cashed 20%",
                        title: "A summer surprise",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                CustomSectionTitle(title: "76".tr),
                Container(
                  height: 140,
                  alignment: Alignment.center,
                  child: CustomCategoriesListView(
                    categories: controller.categories,
                  ),
                ),
                CustomSectionTitle(title: "74".tr),
                const SizedBox(height: 5),
                SizedBox(
                  height: 150,
                  child: CustomItemsListView(items: controller.items),
                ),
                CustomSectionTitle(title: "77".tr),
                SizedBox(
                  height: 150,
                  child: CustomItemsListView(items: controller.items),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
