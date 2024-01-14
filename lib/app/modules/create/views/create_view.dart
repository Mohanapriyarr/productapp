import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:product_app/app/common_views/initial_loader.dart';
import 'package:product_app/app/common_views/input_field.dart';
import 'package:product_app/app/common_views/intermediate_loader.dart';
import 'package:product_app/app/data/functions/field_validations.dart';
import 'package:product_app/app/data/utils/color_utils.dart';
import 'package:product_app/app/data/utils/constant_utils.dart';

import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  const CreateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Product'),
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

  Widget _mainChild({required BuildContext context}) => SizedBox(
        height: DEVICE_HEIGHT,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: PAD_20,
            child: Column(
              children: [
                SPACING_MEDIUM_HEIGHT,
                CreateItemField(controller: controller),
                SPACING_MEDIUM_HEIGHT,
                GestureDetector(
                  onTap: () async => await controller.createBtnOnTap(),
                  child: Padding(
                    padding: PAD_20,
                    child: Container(
                      padding: PAD_12,
                      width: DEVICE_WIDTH,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: GREEN),
                      child: Text(
                        'CREATE',
                        style: h4_dark(context)?.copyWith(
                            color: WHITE, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

class CreateItemField extends StatelessWidget with FieldValidaion {
  final CreateController controller;
  const CreateItemField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: controller.productNameFormKey,
          child: commonField(context,
              textEditingController: controller.productNameTextController,
              focusNode: controller.productNameFocusNode,
              hintText: 'Product Name',
              needNext: true,
              title: 'Product Name',
              validator: (value) => emptyValidation(value, 'Product Name'),
              keyboardType: TextInputType.name),
        ),
        SPACING_SMALL_HEIGHT,
        Form(
          key: controller.productQuantityFormKey,
          child: commonField(context,
              textEditingController: controller.productQuantityTextController,
              focusNode: controller.productQuantityFocusNode,
              hintText: 'Product Quantity',
              needNext: true,
              title: 'Product Quantity',
              validator: (value) => emptyValidation(value, 'Product Quantity'),
              keyboardType: TextInputType.number),
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
