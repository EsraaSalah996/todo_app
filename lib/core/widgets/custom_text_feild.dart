import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController? controller;
  const CustomTextFeild({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Full Name", style: AppTextStyle.bodySmallStyle),
        SizedBox(height: 12),
        TextFormField(
          controller: controller,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          validator: (v) {
            if (v == null || v.isEmpty) {
              return "Name is required";
            } else if (v.length < 2) {
              return "Name must be greater than 1 character";
            }
          },
          decoration: InputDecoration(
            fillColor: Colors.grey.shade300,
            filled: true,
            hintText: "Enter your name",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
