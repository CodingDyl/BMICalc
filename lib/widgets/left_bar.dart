import 'package:flutter/material.dart';
import 'package:supermarket_app/constants/app_constats.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;

  const LeftBar({super.key, required this.barWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
            color: accentHexColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
        ),
      ],
    );
  }
}
