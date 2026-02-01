import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class CustomDeliveryTypeContainer extends StatelessWidget {
  const CustomDeliveryTypeContainer({
    super.key,
    required this.onTap,
    required this.isChoosed,
    required this.deliveryTypeName,
    required this.deliveryTypeImage,
  });

  final bool isChoosed;
  final void Function() onTap;
  final String deliveryTypeName, deliveryTypeImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isChoosed ? AppColor.primaryColorDark : null,
            border: Border.all(color: AppColor.primaryColorDark, width: 2.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                deliveryTypeImage,
                width: 90,
                color: isChoosed ? Colors.white : null,
                errorBuilder:
                    (context, error, stackTrace) => const Icon(
                      Icons.error,
                      color: AppColor.primaryColorDark,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                deliveryTypeName,
                style: TextStyle(
                  fontSize: 19,
                  color: isChoosed ? Colors.white : AppColor.primaryColorDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
