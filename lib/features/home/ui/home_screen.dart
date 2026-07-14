import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/theme/app_text_style.dart';
import 'package:todo_app/core/utils/app_constant.dart';
import 'package:todo_app/features/add_task/ui/add_task_screen.dart';
import 'package:todo_app/features/auth/data/models/user_model.dart';
import 'package:todo_app/features/home/ui/widgets/custom_floating_action_button.dart';
import 'package:todo_app/features/home/ui/widgets/home_header.dart';
import 'package:todo_app/features/home/ui/widgets/static_card.dart';
import 'package:todo_app/features/home/ui/widgets/task_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var userData = Hive.box<UserModel>(AppConstant.userBox).getAt(0);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      floatingActionButton: CustomFloatingActionButton(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
        },
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              HomeHeader(),

              const SizedBox(height: 20),

              const StatisticsCard(),

              const SizedBox(height: 30),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Today's Tasks", style: AppTextStyle.headlineStyle),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: const [
                    TaskCard(
                      color: Colors.blue,
                      title: "Flutter UI",
                      subtitle: "Build Register Screen",
                      status: "Pending",
                      statusColor: Colors.blue,
                    ),

                    SizedBox(height: 18),

                    TaskCard(
                      color: Colors.green,
                      title: "Workout",
                      subtitle: "Gym at 6 PM",
                      status: "Done",
                      statusColor: Colors.green,
                    ),

                    SizedBox(height: 18),

                    TaskCard(
                      color: Colors.orange,
                      title: "Meeting",
                      subtitle: "Team Sync",
                      status: "In Progress",
                      statusColor: Colors.orange,
                    ),

                    SizedBox(height: 18),

                    TaskCard(
                      color: Colors.purple,
                      title: "Read Book",
                      subtitle: "Atomic Habits",
                      status: "Pending",
                      statusColor: Colors.purple,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//comment