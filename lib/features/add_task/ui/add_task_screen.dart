import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/features/add_task/data/task_model.dart';
import 'package:todo_app/features/add_task/widgets/color_picker.dart';
import 'package:todo_app/features/add_task/widgets/custom_dropdown.dart';
import 'package:todo_app/features/add_task/widgets/task_text_feild.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  String selectedStatus = 'Pending';
  final List<String> statusOptions = ['Pending', 'Done'];

  final List<Color> taskColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.teal,
  ];
  int selectedColorIndex = 0;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Add Task",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskTextFeild(
                  title: "Task Title",
                  hint: "Design Login Screen",
                  controller: titleController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Title is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TaskTextFeild(
                  title: "Description",
                  hint: "Task Description...",
                  controller: descriptionController,
                  maxLines: 4,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Description is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomDropdownField(
                  label: "Status",
                  currentValue: selectedStatus,
                  options: statusOptions,
                  onChanged: (newValue) {
                    setState(() {
                      selectedStatus = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 20),

                ColorPicker(
                  colors: taskColors,
                  selectedIndex: selectedColorIndex,
                  onColorSelected: (index) {
                    setState(() {
                      selectedColorIndex = index;
                    });
                  },
                ),
                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A55A2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        var newTask = TaskModel(
                          title: titleController.text.trim(),
                          description: descriptionController.text.trim(),
                          status: selectedStatus,
                          colorCode: taskColors[selectedColorIndex].value,
                        );
                        Hive.box<TaskModel>(AppConstant.taskBox)
                            .add(newTask)
                            .then((value) {
                              Navigator.pop(context);
                            })
                            .catchError((error) {
                              print("Error saving task: $error");
                            });
                      }
                    },
                    child: const Text(
                      "Save Task",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
