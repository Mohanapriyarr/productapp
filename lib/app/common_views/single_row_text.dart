import 'package:flutter/material.dart';
import 'package:product_app/app/data/utils/constant_utils.dart';

class SingleRowText extends StatelessWidget {
  final String title;
  final String subTitle;

  final EdgeInsetsGeometry? padding;

  final TextStyle? style;

  const SingleRowText({
    super.key,
    required this.title,
    required this.subTitle,
    this.padding,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style ?? h4_dark(context),
        ),
        Text(
          subTitle,
          style: style ?? h4_dark(context),
        ),
      ],
    );
  }
}
