import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/class/request_handler_view.dart';
import '../../widget/auth/custom_text_form_field.dart';
import '../../widget/address/custom_material_button.dart';
import '../../../controller/address/address_add_details_controller.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("114".tr),
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primaryColorDark,
      ),
      backgroundColor: AppColor.backgroundColor,
      body: GetBuilder<AddressAddDetailsController>(
        builder: (controller) {
          return RequestHandlerView(
            status: controller.requestStatus,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 35),
              child: Form(
                key: controller.formKey,
                child: Column(
                  spacing: 30,
                  children: [
                    CustomTextFormField(
                      labelText: "city",
                      hintText: "enter city name",
                      keyboardType: TextInputType.name,
                      icon: Icons.location_city_rounded,
                      controller: controller.cityController,
                      validator:
                          (city) =>
                              controller.addressDetailsValidator(city, "city"),
                    ),
                    CustomTextFormField(
                      labelText: "street",
                      hintText: "enter street name",
                      icon: Icons.streetview_rounded,
                      controller: controller.streetController,
                      keyboardType: TextInputType.streetAddress,
                      validator:
                          (street) => controller.addressDetailsValidator(
                            street,
                            "street",
                          ),
                    ),
                    CustomTextFormField(
                      icon: Icons.near_me,
                      labelText: "address name",
                      hintText: "enter address name",
                      controller: controller.nameController,
                      keyboardType: TextInputType.streetAddress,
                      validator:
                          (name) =>
                              controller.addressDetailsValidator(name, "name"),
                    ),
                    CustomMaterailButton(
                      text: "Add",
                      onPressed: controller.addAddressDetails,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
