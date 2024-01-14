import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:product_app/app/common_views/local_asset_image.dart';
import 'package:product_app/app/data/utils/color_utils.dart';
import 'package:product_app/app/data/utils/constant_utils.dart';
import 'package:product_app/app/data/utils/image_utils.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Get.back(), child: const Icon(Icons.arrow_back)),
        title: const Text('Item Details'),
        centerTitle: false,
      ),
      body: Center(child: _mainChild(context: context)),
    );
  }

  Widget _mainChild({required BuildContext context}) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: const LocalAssetImage(
                assetPath: WHATSAPP_ICON,
                height: 100,
                width: 100,
              ),
            ),
            SPACING_SMALL_HEIGHT,
            Text(
              'test',
              style: h4_dark(context)
                  ?.copyWith(color: BLACK, fontWeight: FontWeight.bold),
            ),
            SPACING_SMALL_HEIGHT,
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: DEVICE_WIDTH,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), color: GREEN),
                child: Text(
                  'Order Item',
                  style: h4_dark(context)?.copyWith(color: WHITE),
                ),
              ),
            )
          ],
        ),
      );
}
