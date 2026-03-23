import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/utils/task_categories.dart';

class CategoryNotifier extends Notifier<TaskCategories>{
  @override
  TaskCategories build(){
    return TaskCategories.others;
  }

  void updateCategory(TaskCategories category){
    state = category;
  }
}
final categoryProvider = NotifierProvider<CategoryNotifier, TaskCategories>(CategoryNotifier.new);