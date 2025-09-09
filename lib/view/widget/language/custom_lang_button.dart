import 'package:flutter/material.dart';

import '../../../core/constants/app_color.dart';

class CustomLangButton extends StatelessWidget {
  const CustomLangButton({
    required this.btnTitle,
    required this.onPressed,
    super.key,
  });

  final String btnTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColor.primaryColorDark,
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 90),
      textColor: Colors.white,
      child: Text(
        btnTitle,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
      ),
    );
  }
}
