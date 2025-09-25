import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';

class CustomOfferContainer extends StatelessWidget {
  const CustomOfferContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 190,
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF5673C4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const ListTile(
            title: Text(
              "A summer surprise",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            subtitle: Text(
              "Cashed 20%",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          Positioned(
            top: -25,
            right: -20,
            child: Container(
              width: 190,
              height: 190,
              decoration: const BoxDecoration(
                color: AppColor.primaryColorLight,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
