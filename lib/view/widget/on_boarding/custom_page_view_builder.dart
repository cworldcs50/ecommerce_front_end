import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../data/datasource/static/static.dart';
import '../../../controller/on_boarding_controller.dart';

class CustomPageViewBuilder extends GetView<OnBoardingControllerImp> {
  const CustomPageViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      physics: const BouncingScrollPhysics(),
      onPageChanged: (index) => controller.onPageChanged(index),
      itemCount: onBoardingModels.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset(
              onBoardingModels[index].imageUrl!,
              fit: BoxFit.contain,
              width: 400,
              height: 300,
            ),
            const SizedBox(height: 100),
            Text(
              onBoardingModels[index].title!.tr,
              style: TextTheme.of(context).headlineMedium,
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.sizeOf(context).width,
              alignment: Alignment.center,
              child: Text(
                onBoardingModels[index].body!.tr,
                textAlign: TextAlign.center,
                style: TextTheme.of(context).bodyMedium,
              ),
            ),
          ],
        );
      },
    );
  }
}
