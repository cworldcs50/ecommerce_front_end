import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/shared/custom_app_bar.dart';
import '../../widget/home/custom_section_title.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/class/request_handler_view.dart';
import '../../widget/home/custom_items_list_view.dart';
import '../../widget/home/custom_offer_container.dart';
import '../../widget/home/custom_offer_list_view.dart';
import '../../../core/functions/translate_data_base.dart';
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

class CustomSearchListView extends GetView<HomeControllerImp> {
  const CustomSearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: controller.searchedItems.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 10,
          margin: EdgeInsets.zero,
          color: AppColor.backgroundColor,
          child: Container(
            height: 100,
            alignment: Alignment.center,
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: controller.searchedItems[index].itemsImage,
                errorWidget:
                    (context, url, error) => const Icon(
                      Icons.error,
                      size: 80,
                      color: AppColor.primaryColorLight,
                    ),
                placeholder:
                    (context, url) => ShaderMask(
                      shaderCallback:
                          (bounds) => LinearGradient(
                            colors: [
                              Colors.grey[300]!,
                              Colors.grey[100]!,
                              Colors.grey[300]!,
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ).createShader(bounds),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColorDark,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
              ),
              onTap:
                  () async => await controller.goToSearchItemsDetails(
                    controller.searchedItems[index],
                  ),
              title: Text(
                textAlign: TextAlign.center,
                translateDataBase(
                  controller.searchedItems[index].itemsName,
                  controller.searchedItems[index].itemsNameAr,
                ),
              ),
              subtitle: Text(
                textAlign: TextAlign.center,
                translateDataBase(
                  controller.searchedItems[index].itemsDescription,
                  controller.searchedItems[index].itemsDescriptionAr,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
