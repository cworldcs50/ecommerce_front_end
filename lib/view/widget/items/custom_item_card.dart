import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../data/model/items_model.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/functions/translate_data_base.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../controller/favorites/add_or_remove_favorites_controller.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({
    super.key,
    required this.onTap,
    required this.itemModel,
  });

  final ItemsModel itemModel;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: "${itemModel.itemsId}",
                child: CachedNetworkImage(
                  width: 240,
                  height: 160,
                  fit: BoxFit.fill,
                  imageUrl: itemModel.itemsImage,
                  errorWidget:
                      (context, url, error) => const Icon(
                        Icons.error,
                        color: AppColor.primaryColorDark,
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
                          width: 240,
                          height: 160,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColorDark,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                ),
              ),
              Flexible(
                child: Text(
                  translateDataBase(itemModel.itemsName, itemModel.itemsNameAr),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                child: Text(
                  translateDataBase(
                    itemModel.itemsDescription,
                    itemModel.itemsDescriptionAr,
                  ),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(66, 66, 66, 0.8),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("82".tr),
                  ...List.generate(
                    5,
                    (index) => const Icon(
                      Icons.star,
                      size: 17,
                      color: Colors.amberAccent,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemModel.itemsPrice} \$",
                    style: const TextStyle(
                      color: AppColor.primaryColorDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  GetBuilder<AddOrRemoveFavoritesControllerImp>(
                    builder: (controller) {
                      final String id = "${itemModel.itemsId}";
                      final String isFav =
                          controller.isFavorite[id] ??
                          (itemModel.isFavorite ? "1" : "0");

                      return IconButton(
                        onPressed:
                            () async =>
                                await controller.favoriteHandler(itemModel),
                        icon: Icon(
                          isFav == "1" ? Icons.favorite : Icons.favorite_border,
                          color: AppColor.primaryColorDark,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
