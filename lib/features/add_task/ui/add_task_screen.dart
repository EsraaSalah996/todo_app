import 'package:flutter/material.dart';
import 'package:todo_app/core/widgets/app_button.dart';
import 'package:todo_app/features/add_task/widgets/task_text_feild.dart';
import '../widgets/color_picker.dart';
import '../widgets/custom_dropdown.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Add Task",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TaskTextFeild(title: "Task Title", hint: "Design Login Screen"),
            SizedBox(height: 24),
            TaskTextFeild(
              title: "Description",
              hint: "Task Description...",
              maxLines: 6,
            ),
            SizedBox(height: 24),
            CustomDropdown(),
            SizedBox(height: 24),
            ColorPicker(),
            SizedBox(height: 40),
            AppButton(title: "Save Task", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
