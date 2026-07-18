import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String status;

  @HiveField(3)
  final int colorCode;

  TaskModel({
    required this.title,
    required this.description,
    required this.status,
    required this.colorCode,
  });
}
