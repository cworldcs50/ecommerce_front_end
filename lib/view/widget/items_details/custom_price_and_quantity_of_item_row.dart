import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class CustomPriceAndQuantityOfItemRow extends StatelessWidget {
  const CustomPriceAndQuantityOfItemRow({
    super.key,
    required this.add,
    required this.price,
    required this.count,
    required this.remove,
  });

  final int count;
  final double price;
  final void Function() add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: add, icon: const Icon(Icons.add)),
            Container(
              padding: const EdgeInsets.only(bottom: 8, left: 6, right: 6),

              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(border: Border.all()),
              child: Text(
                "$count",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 0.9,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(onPressed: remove, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text(
          "$price \$",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            height: 1.5,
            color: AppColor.primaryColorDark,
          ),
        ),
      ],
    );
  }
}
