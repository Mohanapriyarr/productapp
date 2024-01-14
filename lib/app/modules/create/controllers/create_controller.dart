import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/app/data/services/repository/add_product_api.dart';
import 'package:product_app/app/data/utils/constant_utils.dart';
import 'package:product_app/app/modules/home/controllers/home_controller.dart';
import 'package:uuid/uuid.dart';

class CreateController extends GetxController with StateMixin<bool> {
  final isLoading = false.obs;

  final TextEditingController productNameTextController =
      TextEditingController();
  final FocusNode productNameFocusNode = FocusNode();
  final GlobalKey<FormState> productNameFormKey = GlobalKey();

  final TextEditingController productQuantityTextController =
      TextEditingController();

  final FocusNode productQuantityFocusNode = FocusNode();
  final GlobalKey<FormState> productQuantityFormKey = GlobalKey();

  var uuid = const Uuid();

  @override
  void onInit() {
    change(null, status: RxStatus.loading());

    change(null, status: RxStatus.success());

    super.onInit();
  }

  Future<void> addProduct() async {
    isLoading.value = true;
    // Generate a id
    final productId = uuid.v1();
    final response = await addProductApi(
        productName: productNameTextController.text,
        quantity: int.parse(productQuantityTextController.text),
        id: productId);
    if (response == null) {
      isLoading.value = false;
      return;
    }
    isLoading.value = false;
    Get.put<HomeController>(HomeController()).onInit();
    Get.back();
  }

  Future<void> createBtnOnTap() async {
    bool isAllFieldsValidated = validateEachFields();
    if (!isAllFieldsValidated) return;
    await addProduct();
  }

  //? validation
  bool validateEachFields() {
    if (!productNameFormKey.currentState!.validate()) {
      Scrollable.ensureVisible(productNameFormKey.currentContext!,
          duration: FIVE_HUNDRED_MIL, curve: Curves.fastOutSlowIn);
      productNameFocusNode.requestFocus();
      return false;
    }
    if (!productQuantityFormKey.currentState!.validate()) {
      Scrollable.ensureVisible(productQuantityFormKey.currentContext!,
          duration: FIVE_HUNDRED_MIL, curve: Curves.fastOutSlowIn);
      productQuantityFocusNode.requestFocus();
      return false;
    }
    return true;
  }
}
