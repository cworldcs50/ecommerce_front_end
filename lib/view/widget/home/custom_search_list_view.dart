import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/functions/translate_data_base.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
