import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DashedWidget extends StatelessWidget {
  const DashedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.black38,
      dashPattern: [8, 4],
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: const EdgeInsets.all(6),
      strokeWidth: 2,
      child: const FlutterLogo(
        size: 148,
      ),
    );
  }
}
