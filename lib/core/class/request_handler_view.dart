import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/app_image_assets.dart';
import '../constants/enums/request_status.dart';

class RequestHandlerView extends StatelessWidget {
  const RequestHandlerView({
    super.key,
    required this.status,
    required this.child,
  });

  final Widget child;
  final RequestStatus? status;
  
  @override
  Widget build(BuildContext context) {
    switch (status) {
      case RequestStatus.loading:
        return Center(child: Lottie.asset(AppImageAssets.loading));
      case RequestStatus.offlineFailure:
        return Center(child: Lottie.asset(AppImageAssets.offline));
      case RequestStatus.serverFailure:
        return Center(child: Lottie.asset(AppImageAssets.serverFailure));
      case RequestStatus.failure:
        return Center(child: Lottie.asset(AppImageAssets.failure));
      default:
        return child;
    }
  }
}
