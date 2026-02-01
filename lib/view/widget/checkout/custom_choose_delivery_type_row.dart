import 'package:flutter/material.dart';
import 'custom_delivery_type_container.dart';
import '../../../core/constants/app_image_assets.dart';

class CustomChooseDeliveryTypeRow extends StatelessWidget {
  const CustomChooseDeliveryTypeRow({
    super.key,
    required this.delivery,
    required this.driveThru,
    required this.deliveryChoosedCondition,
    required this.driveThruChoosedCondition,
  });

  final void Function() delivery, driveThru;
  final bool deliveryChoosedCondition, driveThruChoosedCondition;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomDeliveryTypeContainer(
            onTap: delivery,
            deliveryTypeName: "delivery",
            isChoosed: deliveryChoosedCondition,
            deliveryTypeImage: AppImageAssets.delivery,
          ),
        ),
        Expanded(
          child: CustomDeliveryTypeContainer(
            onTap: driveThru,
            deliveryTypeName: "drive thru",
            isChoosed: driveThruChoosedCondition,
            deliveryTypeImage: AppImageAssets.driveThru,
          ),
        ),
      ],
    );
  }
}
