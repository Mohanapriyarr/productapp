import 'package:flutter/material.dart';
import 'package:product_app/app/data/utils/color_utils.dart';
import 'package:product_app/app/data/utils/constant_utils.dart';

class CommonDivider extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  final Color? dividerColor;
  final TextStyle? style;
  const CommonDivider(
      {super.key,
      required this.text,
      this.style,
      this.padding,
      this.dividerColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: dividerColor ?? CONTAINER_COLOR,
            ),
          ),
          SPACING_VSMALL_WIDTH,
          Text(
            text,
            style: style ?? h4_dark(context)?.copyWith(color: BLACK),
          ),
          SPACING_VSMALL_WIDTH,
          Expanded(
            child: Divider(
              color: dividerColor ?? CONTAINER_COLOR,
            ),
          )
        ],
      ),
    );
  }
}
