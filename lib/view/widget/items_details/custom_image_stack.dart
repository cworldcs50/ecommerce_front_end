import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../controller/items/items_details_controller.dart';

class CustomImageStack extends GetView<ItemsDetailsControllerImp> {
  const CustomImageStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColor.primaryColorDark,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
          ),
          height: 220,
        ),
        Positioned(
          top: 50,
          child: Hero(
            tag: "${controller.item.itemsId}",
            transitionOnUserGestures: true,
            child: CachedNetworkImage(
              imageUrl: controller.item.itemsImage,
              height: 250,
              fit: BoxFit.fill,
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
                      width: 90,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColorDark,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
