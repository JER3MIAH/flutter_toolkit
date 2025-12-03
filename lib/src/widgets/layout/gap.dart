import 'package:flutter/material.dart';

class XGap extends StatelessWidget {
  const XGap(this.width, {super.key});

  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class YGap extends StatelessWidget {
  const YGap(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

