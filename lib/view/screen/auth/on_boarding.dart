import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../widget/on_boarding/custom_button.dart';
import '../../widget/on_boarding/custom_slider.dart';
import '../../widget/on_boarding/custom_page_view_builder.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Column(
          children: [
            SizedBox(height: 50),
            Expanded(flex: 4, child: CustomPageViewBuilder()),
            Expanded(
              flex: 1,
              child: Column(
                children: [CustomSlider(), Spacer(), CustomButton()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
