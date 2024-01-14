import 'package:flutter/material.dart';
import 'package:product_app/app/data/utils/color_utils.dart';
import 'package:product_app/app/data/utils/constant_utils.dart';

class TitleNSubtitle extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool needSubTitle;
  final EdgeInsetsGeometry? padding;
  final bool needSpace;
  final TextStyle? style;
  final TextStyle? subTitleStyle;
  const TitleNSubtitle(
      {super.key,
      required this.title,
      this.subTitle,
      required this.needSubTitle,
      this.needSpace = true,
      this.padding,
      this.style,
      this.subTitleStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MAIN_AXIS_START,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: CENTER_ALIGN,
          style: style ?? h4_dark(context),
        ),
        // needSpace ? SPACING_SMALL_HEIGHT : SHOW_NOTHING,
        needSubTitle
            ? Align(
                alignment: Alignment.topRight,
                child: Text(
                  subTitle!,
                  textAlign: TextAlign.end,
                  style:
                      subTitleStyle ?? h4_dark(context)?.copyWith(color: BLUE),
                ),
              )
            : SHOW_NOTHING,
      ],
    );
  }
}
