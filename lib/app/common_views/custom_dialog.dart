import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/app/data/utils/color_utils.dart';
import 'package:product_app/app/data/utils/constant_utils.dart';

class CustomeDialog extends StatelessWidget {
  final Widget mainContent;
  final Function()? onCancelTapped;
  final bool needCancelBtn;
  final double? borderRadius;
  final bool needPadding;
  const CustomeDialog(
      {super.key,
      required this.mainContent,
      this.onCancelTapped,
      this.borderRadius,
      this.needPadding = true,
      required this.needCancelBtn});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0.0,
      backgroundColor: TRANSPARENT,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 0.0, right: 0.0),
        child: Stack(
          children: [
            Container(
              padding: needPadding
                  ? EdgeInsets.symmetric(
                      vertical: needCancelBtn ? 30.0 : 15.0, horizontal: 15)
                  : EdgeInsets.zero,
              decoration: BoxDecoration(
                color: WHITE,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 0.0,
                      offset: Offset(0.0, 0.0))
                ],
              ),
              child: mainContent,
            ),
            needCancelBtn
                ? Positioned(
                    right: 0.0,
                    child: GestureDetector(
                      onTap: onCancelTapped ?? () => Get.back(),
                      child: const Padding(
                        padding: PAD_12,
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.cancel)),
                      ),
                    ))
                : SHOW_NOTHING
          ],
        ),
      );
}
