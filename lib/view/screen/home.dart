import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_color.dart';
import '../../controller/home_controller.dart';
import '../../core/shared/custom_app_bar.dart';
import '../../core/class/request_handler_view.dart';
import '../widget/home/custom_items_list_view.dart';
import '../widget/home/custom_offer_container.dart';
import '../widget/home/custom_categoires_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RequestHandlerView(
              status: controller.requestStatus,
              child: ListView(
                children: [
                  CustomAppBar(title: "75".tr, onPressed: () {}),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    height: 200,
                    child: ListView.separated(
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder:
                          (context, index) => const SizedBox(width: 20),
                      itemBuilder:
                          (context, index) => const CustomOfferContainer(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 140,
                    alignment: Alignment.center,
                    child: CustomCategoriesListView(
                      categories: controller.categories,
                    ),
                  ),
                  Text(
                    "74".tr,
                    style: const TextStyle(
                      fontSize: 22,
                      color: AppColor.primaryColorDark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 150,
                    child: CustomItemsListView(items: controller.items),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
