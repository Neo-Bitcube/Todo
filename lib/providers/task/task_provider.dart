import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/providers/task/task.dart';

final taskProvider = NotifierProvider<TaskNotifier, TaskState>(TaskNotifier.new);
