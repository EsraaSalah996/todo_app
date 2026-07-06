import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    const colors = [
      Color(0xff2196F3),
      Color(0xff4CAF50),
      Color(0xffFF9800),
      Color(0xff9C27B0),
      Color(0xffF44336),
      Color(0xff009688),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Choose Color",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            colors.length,
            (index) => Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: colors[index],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
