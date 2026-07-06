import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_color.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: AppTextStyle.bodyLargeStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
