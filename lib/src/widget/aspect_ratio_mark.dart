import 'package:flutter/material.dart';

class AspectRatioMark extends StatelessWidget {
  const AspectRatioMark(this.aspectRatio,
      {this.markColor = Colors.black, Key? key})
      : super(key: key);
  final double aspectRatio;
  final Color markColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: markColor,
          ),
        ),
        AspectRatio(
          aspectRatio: aspectRatio,
          child: SizedBox(),
        ),
        Expanded(
          child: Container(
            color: markColor,
          ),
        ),
      ],
    );
  }
}
