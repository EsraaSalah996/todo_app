import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/features/add_task/ui/add_task_screen.dart';
import 'package:todo_app/features/home/ui/widgets/custom_floating_action_button.dart';
import 'package:todo_app/features/home/ui/widgets/home_header.dart';
import 'package:todo_app/features/home/ui/widgets/static_card.dart';
import 'package:todo_app/features/home/ui/widgets/task_card.dart';
import 'package:todo_app/features/add_task/data/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<TaskModel>(AppConstant.taskBox);
    List<TaskModel> tasks = box.values.toList();
    int totalTasks = tasks.length;

    int doneTasks = tasks.where((task) => task.status == 'Done').length;

    int pendingTasks = tasks.where((task) => task.status == 'Pending').length;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      floatingActionButton: CustomFloatingActionButton(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          ).then((value) {
            setState(() {});
          });
        },
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              HomeHeader(),
              const SizedBox(height: 20),
              StatisticsCard(
                totalTasks: totalTasks,
                doneTasks: doneTasks,
                pendingTasks: pendingTasks,
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Today's Tasks", style: AppTextStyle.headlineStyle),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: tasks.isEmpty
                    ? const Center(
                        child: Text(
                          "No Tasks Yet!",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      )
                    : ListView.separated(
                        itemCount: tasks.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 18),
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          return TaskCard(
                            title: task.title,
                            subtitle: task.description,
                            status: task.status,
                            color: Color(task.colorCode),
                            statusColor: task.status == 'Done'
                                ? Colors.green
                                : Colors.orange,
                            onDelete: () {
                              box.deleteAt(index);

                              setState(() {});

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Task deleted successfully!"),
                                  backgroundColor: Colors.redAccent,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
