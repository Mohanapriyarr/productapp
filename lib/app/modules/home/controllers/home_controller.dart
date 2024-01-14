import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/app/data/services/model/product_list_model.dart';
import 'package:product_app/app/data/services/repository/order_product_api.dart';
import 'package:product_app/app/data/services/repository/product_list_api.dart';
import 'package:product_app/app/data/utils/constant_utils.dart';
import 'package:uuid/uuid.dart';

class HomeController extends GetxController with StateMixin<bool> {
  final isLoading = false.obs;

  final TextEditingController searchTextController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  final TextEditingController quantityTextController = TextEditingController();
  final FocusNode quantityFocusNode = FocusNode();
  final GlobalKey<FormState> quantityFormKey = GlobalKey();

  final productList = <ProductListModel>[].obs;
  final searchList = <ProductListModel>[].obs;

  var uuid = const Uuid();

  @override
  Future<void> onInit() async {
    change(null, status: RxStatus.loading());
    await productListData();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> productListData() async {
    isLoading.value = true;
    final response = await productListApi();
    if (response == null) {
      isLoading.value = false;
      return;
    }
    productList.value = response;
    searchList.value = response;
    isLoading.value = false;
  }

  Future<void> orderBtnOnTap() async {
    bool isAllFieldsValidated = validateEachFields();
    if (!isAllFieldsValidated) return;
    isLoading.value = true;
    // Generate a id
    final productId = uuid.v1();
    final response = await orderProductApi(
        orderId: productId,
        customerId: productId,
        quantity: int.parse(quantityTextController.text),
        id: productId);
    if (response == null) {
      isLoading.value = false;
      return;
    }
    isLoading.value = false;
    Get.back();
  }

  Future<void> searchListData() async {
    searchList.value = productList
        .where((e) => e.productName
            .toLowerCase()
            .contains(searchTextController.text.toLowerCase()))
        .toList();
  }

  //? validation
  bool validateEachFields() {
    if (!quantityFormKey.currentState!.validate()) {
      Scrollable.ensureVisible(quantityFormKey.currentContext!,
          duration: FIVE_HUNDRED_MIL, curve: Curves.fastOutSlowIn);
      quantityFocusNode.requestFocus();
      return false;
    }
    return true;
  }
}
