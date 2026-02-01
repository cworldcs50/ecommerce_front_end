import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class CustomPaymentMethodContainer extends StatelessWidget {
  const CustomPaymentMethodContainer({
    super.key,
    required this.onTap,
    required this.title,
    required this.isChoosed,
  });

  final String title;
  final bool isChoosed;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color:
              isChoosed
                  ? AppColor.primaryColorDark
                  : AppColor.primaryColorLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(title, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
