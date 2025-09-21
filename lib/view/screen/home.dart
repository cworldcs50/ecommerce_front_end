import 'package:flutter/material.dart';
import '../../core/constants/app_color.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Row(
              spacing: 10,
              children: [
                Expanded(child: CustomTextFormField()),
                CustomNotificationBill(),
              ],
            ),
          ),
          const CustomOfferContainer(),
        ],
      ),
    );
  }
}

class CustomOfferContainer extends StatelessWidget {
  const CustomOfferContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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

class CustomNotificationBill extends StatelessWidget {
  const CustomNotificationBill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 61,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_active_outlined, size: 30),
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        hintText: "Find Product",
        fillColor: Colors.grey[200],
        hintStyle: const TextStyle(fontSize: 20),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Icon(size: 30, Icons.search),
      ),
    );
  }
}
