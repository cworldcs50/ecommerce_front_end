import 'dart:async';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import '../../core/constants/app_routes_names.dart';
import '../../core/constants/enums/request_status.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAddController extends GetxController {
  List<Marker> markers = [];
  CameraPosition? currentPos;
  RequestStatus? requestStatus;
  late double lat, long;
  final Completer<GoogleMapController> googleMapcontroller =
      Completer<GoogleMapController>();

  void addMarker(LatLng latLng) {
    markers
      ..clear()
      ..add(Marker(markerId: MarkerId("${latLng.latitude}"), position: latLng));
    update();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getCurrentPos();
  }

  void addressAddPartTwo() async => await Get.toNamed(
    AppRoutesNames.kAddressAddDetails,
    arguments: {"lat": lat, "long": long},
  );

  Future<void> getCurrentPos() async {
    requestStatus = RequestStatus.loading;
    update();
    final Position pos = await Geolocator.getCurrentPosition();
    currentPos = CameraPosition(
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
      bearing: 192.8334901395799,
      target: LatLng(pos.latitude, pos.longitude),
    );
    lat = pos.latitude;
    long = pos.longitude;
    requestStatus = null;
    update();
  }
}
