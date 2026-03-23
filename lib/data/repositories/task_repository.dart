import 'package:todo/data/data.dart';

abstract class TaskRepository {
  Future<List<Task>> getAllTasks();
  Future<void> deleteTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> createTask(Task task);
}