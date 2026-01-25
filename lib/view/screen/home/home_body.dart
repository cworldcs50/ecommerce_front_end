import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/shared/custom_app_bar.dart';
import '../../widget/home/custom_section_title.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/class/request_handler_view.dart';
import '../../widget/home/custom_items_list_view.dart';
import '../../widget/home/custom_offer_container.dart';
import '../../widget/home/custom_offer_list_view.dart';
import '../../widget/home/custom_search_list_view.dart';
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
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CustomAppBar(
                    title: "75".tr,
                    onPressedIcon: () {},
                    onFieldSubmitted:
                        (_) async => await controller.onSearchItems(),
                    onChanged: controller.checkSearch,
                    controller: controller.searchController,
                    onPressedSearch: controller.onSearchItems,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 10)),
                controller.isSearch
                    ? const CustomSearchListView()
                    : SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomSectionTitle(title: "76".tr),
                          ),
                          Container(
                            height: 140,
                            alignment: Alignment.centerLeft,
                            child: CustomCategoriesListView(
                              categories: controller.categories,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomSectionTitle(title: "74".tr),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 150,
                            child: CustomItemsListView(items: controller.items),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomSectionTitle(title: "77".tr),
                          ),
                          SizedBox(
                            height: 150,
                            child: CustomItemsListView(items: controller.items),
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
