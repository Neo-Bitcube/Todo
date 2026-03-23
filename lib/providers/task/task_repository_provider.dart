import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data/repositories/repositories.dart';
import 'package:todo/data/datasource/task_datasource_provider.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(taskDatasourceProvider);
  return TaskRepositoryImpl(datasource);
});
