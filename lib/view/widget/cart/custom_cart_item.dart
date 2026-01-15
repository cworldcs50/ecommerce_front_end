import 'package:flutter/material.dart';
import '../../../data/model/cart_model.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/constants/app_api_links.dart';
import '../../../core/functions/translate_data_base.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    required this.addItem,
    required this.cartModel,
    required this.totalCount,
    required this.removeItem,
    super.key,
  });

  final int totalCount;
  final CartModel cartModel;
  final void Function() addItem, removeItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
              "${AppApiLinks.kItemsImages}/${cartModel.itemsImage}",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(
                translateDataBase(cartModel.itemsName, cartModel.itemsNameAr),
              ),
              subtitle: Text(
                "${cartModel.itemsPrice} \$",
                style: const TextStyle(
                  fontFamily: "sans",
                  color: AppColor.primaryColorDark,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                IconButton(onPressed: addItem, icon: const Icon(Icons.add)),
                Text(
                  "${cartModel.noItem}",
                  style: const TextStyle(fontFamily: "sans", fontSize: 18),
                ),
                IconButton(
                  onPressed: removeItem,
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
