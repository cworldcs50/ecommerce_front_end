import 'package:flutter/material.dart';

import '../../../core/constants/app_color.dart';

class CustomCheckoutContainer extends StatelessWidget {
  const CustomCheckoutContainer({
    required this.onPressed,
    required this.title,
    required this.canCheckOut,
    super.key,
  });

  final void Function() onPressed;
  final String title;
  final bool canCheckOut;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: MaterialButton(
        onPressed: onPressed,
        textColor: Colors.white,
        color:
            canCheckOut
                ? AppColor.primaryColorDark
                : AppColor.primaryColorLight,
        padding: const EdgeInsets.symmetric(vertical: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
