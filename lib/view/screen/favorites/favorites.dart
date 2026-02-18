import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_routes_names.dart';
import '../../../core/shared/custom_app_bar.dart';
import '../../../core/class/request_handler_view.dart';
import '../../widget/favorites/custom_favorites_grid.dart';
import '../../../controller/favorites/favorites_view_controller.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: GetBuilder<FavoritesViewControllerImp>(
        builder: (controller) {
          return Column(
            children: [
              CustomAppBar(
                title: "75".tr,
                onPressedIcon:
                    () async => await Get.toNamed(AppRoutesNames.kNotification),
                onChanged: controller.checkSearch,
                controller: controller.searchController,
                onPressedSearch: controller.onSearchItems,
                onFieldSubmitted: (_) async => await controller.onSearchItems(),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: RequestHandlerView(
                  status: controller.getFavoritesItemsRequestStatus,
                  child:
                      controller.isSearch
                          ? CustomFavoritesGrid(items: controller.searchedItems)
                          : CustomFavoritesGrid(
                            items: controller.favoritesItems,
                          ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
