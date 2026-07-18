import 'package:flutter/material.dart';

class TaskTextFeild extends StatelessWidget {
  final String title;
  final String hint;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const TaskTextFeild({
    super.key,
    required this.title,
    required this.hint,
    this.maxLines = 1,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        TextFormField(
          maxLines: maxLines,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
