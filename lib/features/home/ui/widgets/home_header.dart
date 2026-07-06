import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_color.dart';
import 'package:todo_app/core/theme/app_text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: AppColor.primaryColor,
          child: const Icon(Icons.person, color: Colors.white),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good Morning!!", style: AppTextStyle.hintStyle),
              Text("Esraa", style: AppTextStyle.headlineStyle),
            ],
          ),
        ),

        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        ),
      ],
    );
  }
}
