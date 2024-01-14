import 'package:flutter/material.dart';
import 'package:product_app/app/common_views/initial_loader.dart';
import 'package:product_app/app/data/utils/color_utils.dart';
import 'package:product_app/app/data/utils/constant_utils.dart';

class IntermediateLoader extends StatelessWidget {
  const IntermediateLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        width: DEVICE_WIDTH,
        height: DEVICE_HEIGHT,
        color: WHITE_OPACITY_8,
        child: const InitialLoader(),
      ),
    );
  }
}
