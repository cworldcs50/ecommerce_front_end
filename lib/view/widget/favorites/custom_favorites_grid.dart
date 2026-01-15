import 'package:get/get.dart';
import 'custom_favorites_card.dart';
import 'package:flutter/material.dart';
import '../../../data/model/favorite_item_model.dart';
import '../../../controller/favorites/favorites_view_controller.dart';

class CustomFavoritesGrid extends StatelessWidget {
  const CustomFavoritesGrid({required this.items, super.key});

  final List<FavoriteItemModel> items;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesViewControllerImp>(
      builder: (controller) {
        return GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
          ),
          itemBuilder:
              (context, index) => CustomFavoriteCard(
                deleteFavorite:
                    () async => await controller.removeFromFavoritesPage(
                      "${items[index].itemsId}",
                    ),
                itemModel: items[index],
                onTap: () async => await controller.itemDetails(items[index]),
              ),
        );
      },
    );
  }
}
