import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../data/model/favorite_item_model.dart';
import '../../../core/functions/translate_data_base.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomFavoriteCard extends StatelessWidget {
  const CustomFavoriteCard({
    super.key,
    required this.onTap,
    required this.deleteFavorite,
    required this.itemModel,
  });

  final FavoriteItemModel itemModel;
  final void Function() onTap, deleteFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: "${itemModel.itemsId}",
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: 160,
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
                    color: Color.fromRGBO(66, 66, 66, 0.8),
                  ),
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    Text("82".tr),
                    const Spacer(),
                    ...List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        // size: 17,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${itemModel.itemsPriceAfterDiscount}\$",
                      style: const TextStyle(
                        color: AppColor.primaryColorDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (itemModel.itemsDiscount > 0)
                      Text(
                        "${itemModel.itemsPrice}\$",
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(
                          decorationThickness: 3.5,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColorDark,
                          decorationColor: Colors.redAccent,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    if (itemModel.itemsDiscount > 0)
                      Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "${itemModel.itemsDiscount}%",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: deleteFavorite,
                      style: IconButton.styleFrom(padding: EdgeInsets.zero),
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        color: AppColor.primaryColorDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
