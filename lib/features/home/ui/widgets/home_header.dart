import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/theme/app_color.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/features/auth/data/models/user_model.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // var userData = Hive.box<UserModel>(AppConstant.userBox).getAt(0);
    var userData = Hive.box<UserModel>(AppConstant.userBox).getAt(0);

    return Row(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundImage: Image.file(File(userData?.image ?? "")).image,
          /*  backgroundColor: AppColor.primaryColor,
          child: const Icon(Icons.person, color: Colors.white), */
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good Morning!!", style: AppTextStyle.hintStyle),
              Text(userData?.name ?? "", style: AppTextStyle.headlineStyle),
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
