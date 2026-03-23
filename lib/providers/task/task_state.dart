import 'package:equatable/equatable.dart';
import 'package:todo/data/models/task.dart';

class TaskState extends Equatable {
  final List<Task> tasks;

  @override
  List<Object> get props => [tasks];

  const TaskState(this.tasks);

  const TaskState.initial({this.tasks = const []});

  TaskState copyWith({List<Task>? tasks}) {
    return TaskState(tasks ?? this.tasks);
  }
}
