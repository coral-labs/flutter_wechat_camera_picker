import 'package:flutter/material.dart';

class AspectRatioMark extends StatelessWidget {
  const AspectRatioMark(this.aspectRatio,
      {this.markColor = Colors.black, Key? key, this.child})
      : super(key: key);
  final double aspectRatio;
  final Color markColor;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? Column(
            children: [
              Expanded(
                child: Container(
                  color: markColor,
                ),
              ),
              AspectRatio(
                aspectRatio: aspectRatio,
                child: child,
              ),
              Expanded(
                child: Container(
                  color: markColor,
                ),
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: Container(
                  color: markColor,
                ),
              ),
              AspectRatio(
                aspectRatio: aspectRatio,
                child: child,
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
