import 'package:flutter/material.dart';

class LocalAssetImage extends StatelessWidget {
  final String assetPath;
  final Color? color;
  final BoxFit boxFit;
  final double height;
  final double width;
  final Function()? onTap;

  const LocalAssetImage(
      {super.key,
      required this.assetPath,
      this.color,
      this.boxFit = BoxFit.contain,
      this.height = 12,
      this.width = 12,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    precacheImage(Image.asset(assetPath).image, context);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: Image.asset(
          assetPath,
          color: color,
          fit: boxFit,
          frameBuilder: (BuildContext context, Widget childs, int? frame,
              bool wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) {
              return childs;
            }
            return AnimatedOpacity(
              child: childs,
              opacity: frame == null ? 0 : 1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut,
            );
          },
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
