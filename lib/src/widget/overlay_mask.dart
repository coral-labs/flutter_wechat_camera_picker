import 'package:flutter/material.dart';

class OverlayMask extends StatelessWidget {
  final AlignmentGeometry alignment;
  final BorderRadiusGeometry? borderRadius;
  final double aspectRatio;
  final EdgeInsetsGeometry? padding;
  const OverlayMask({
    Key? key,
    required this.alignment,
    required this.aspectRatio,
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcOut),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            padding: padding,
            child: Align(
              alignment: alignment,
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: borderRadius,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
