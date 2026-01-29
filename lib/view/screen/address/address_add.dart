import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_color.dart';
import '../../../core/class/request_handler_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/address/address_add_controller.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("109".tr),
        foregroundColor: Colors.white,
        backgroundColor: AppColor.primaryColorDark,
      ),

      body: GetBuilder<AddressAddController>(
        builder:
            (controller) => RequestHandlerView(
              status: controller.requestStatus,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  if (controller.currentPos != null)
                    Expanded(
                      child: GoogleMap(
                        mapType: MapType.normal,
                        onTap: controller.addMarker,
                        markers: controller.markers.toSet(),
                        initialCameraPosition: controller.currentPos!,
                        onMapCreated: (GoogleMapController ctrl) {
                          controller.googleMapcontroller.complete(ctrl);
                        },
                      ),
                    ),
                  MaterialButton(
                    onPressed: controller.addressAddPartTwo,
                    color: AppColor.primaryColorDark,
                    child: Text(
                      "113".tr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
