import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:product_app/app/common_views/custom_dialog.dart';
import 'package:product_app/app/common_views/initial_loader.dart';
import 'package:product_app/app/common_views/input_field.dart';
import 'package:product_app/app/common_views/intermediate_loader.dart';
import 'package:product_app/app/common_views/local_asset_image.dart';
import 'package:product_app/app/data/functions/field_validations.dart';
import 'package:product_app/app/data/utils/color_utils.dart';
import 'package:product_app/app/data/utils/constant_utils.dart';
import 'package:product_app/app/data/utils/string_utils.dart';
import 'package:product_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.CREATE),
          backgroundColor: GREEN,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: const Icon(
            Icons.add,
            color: WHITE,
          ),
        ),
        appBar: AppBar(
          title: const Text('Product List'),
          centerTitle: false,
        ),
        body: Obx(
          () => Stack(
            children: [
              Center(
                child: controller.obx(
                  (state) => _mainChild(
                    context: context,
                  ),
                  onLoading: const InitialLoader(),
                  onError: ((error) => Text(
                        error.toString(),
                        style: h4_dark(context),
                      )),
                ),
              ),
              controller.isLoading.isTrue
                  ? const IntermediateLoader()
                  : SHOW_NOTHING
            ],
          ),
        ));
  }

  Widget _mainChild({required BuildContext context}) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // _searchBox(context: context),
            SPACING_SMALL_HEIGHT,
            _gridItem(context: context)
          ],
        ),
      );

  Widget _searchBox({required BuildContext context}) => InputField(
      textEditingController: controller.searchTextController,
      prefixIcon: const Icon(Icons.search),
      focusNode: controller.searchFocusNode,
      borderSide: const BorderSide(width: 0.8, color: DARK_BLUE),
      onChanged: (value) => controller.searchListData(),
      hintText: SEARCH);

  Widget _gridItem({required BuildContext context}) => Expanded(
        child: GridView.builder(
            itemCount: controller.searchList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, i) => Card(
                  elevation: 5,
                  shadowColor: Colors.black,
                  color: WHITE,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Column(
                      children: [
                        SPACING_SMALL_HEIGHT,
                        ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: const CircleAvatar(
                                backgroundColor: GREEN,
                                child: Icon(Icons.production_quantity_limits))),
                        Text(
                          controller.searchList[i].productName,
                          style: h4_dark(context)?.copyWith(
                              color: BLACK, fontWeight: FontWeight.bold),
                        ),
                        SPACING_VSMALL_HEIGHT,
                        Text(
                          'Quantity: ${controller.searchList[i].availableQuantity}',
                          style: h4_dark(context)
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SPACING_SMALL_HEIGHT,
                        GestureDetector(
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (context) => CustomeDialog(
                                      mainContent:
                                          OrderItems(controller: controller),
                                      needCancelBtn: true,
                                    ));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: GREEN),
                            child: Text(
                              'ORDER',
                              style: h4_dark(context)?.copyWith(
                                  color: WHITE, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
      );
}

class OrderItems extends StatelessWidget with FieldValidaion {
  final HomeController controller;
  const OrderItems({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MIN,
      children: [
        Form(
          key: controller.quantityFormKey,
          child: commonField(context,
              textEditingController: controller.quantityTextController,
              focusNode: controller.quantityFocusNode,
              hintText: 'Product Quantity',
              needNext: true,
              title: 'Product Quantity',
              validator: (value) => emptyValidation(value, 'Product Quantity'),
              keyboardType: TextInputType.number),
        ),
        SPACING_MEDIUM_HEIGHT,
        GestureDetector(
          onTap: () async => await controller.orderBtnOnTap(),
          child: Padding(
            padding: PAD_20,
            child: Container(
              padding: PAD_12,
              width: DEVICE_WIDTH,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0), color: GREEN),
              child: Text(
                'ORDER ITEM',
                style: h4_dark(context)
                    ?.copyWith(color: WHITE, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}

Widget commonField(
  BuildContext context, {
  required TextEditingController textEditingController,
  required FocusNode focusNode,
  required String hintText,
  Icon? prefixIcon,
  Icon? suffixIcon,
  TextCapitalization textCapital = NONE,
  bool obscureText = false,
  required bool needNext,
  required String title,
  required TextInputType keyboardType,
  dynamic Function(String)? onFieldSubmitted,
  String? Function(String?)? validator,
}) {
  return Column(
    mainAxisSize: MAX,
    crossAxisAlignment: CROSS_AXIS_START,
    children: [
      Text(
        title,
        style: h4_dark(context),
      ),
      SPACING_VVSMALL_HEIGHT,
      InputField(
        textEditingController: textEditingController,
        focusNode: focusNode,
        textCapital: textCapital,
        keyboardType: keyboardType,
        textInputAction: needNext ? INPUT_NEXT : INPUT_DONE,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        obscureText: obscureText,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
      ),
    ],
  );
}
