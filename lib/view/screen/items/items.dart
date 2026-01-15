import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/shared/custom_app_bar.dart';
import '../../widget/items/custom_items_grid.dart';
import '../../../core/class/request_handler_view.dart';
import '../../../controller/items/items_controller.dart';
import '../../widget/home/custom_items_categories_list_view.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: GetBuilder<ItemsControllerImp>(
        builder: (controller) {
          return Column(
            children: [
              CustomAppBar(
                title: "75".tr,
                onPressedIcon: () {},
                onPressedSearch: () {},
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 40,
                child: CustomItemsCategoriesListView(
                  categories: controller.categories,
                  trueIndex: controller.selectedId,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: RequestHandlerView(
                  status: controller.requestStatus,
                  child: CustomItemsGrid(items: controller.items),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
