import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo/config/routes/route_location.dart';
import 'package:todo/data/data.dart';
import 'package:todo/providers/providers.dart';
import 'package:todo/utils/extensions.dart';
import 'package:todo/utils/helpers.dart';
import 'package:todo/utils/task_categories.dart';
import 'package:todo/widgets/display_list_of_tasks.dart';
import 'package:todo/widgets/display_white_text.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) => const HomeScreen();
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final colors = context.colorScheme;
    final taskState = ref.watch(taskProvider);
    final completedTasks = _completedTasks(taskState.tasks, ref);
    final incompleteTasks = _incompleteTasks(taskState.tasks, ref);
    final selectedDate = ref.watch(dateProvider);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Helpers.selectDate(context, ref),
                        child: DisplayWhiteText(
                            text: DateFormat.yMMMd().format(selectedDate),
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Gap(10),
                      const DisplayWhiteText(
                        text: 'My Todo List',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTasks(
                      tasks: incompleteTasks,),
                    const Gap(20),
                    Text('Completed', style: context.textTheme.headlineMedium,),
                    const Gap(20),
                    DisplayListOfTasks(
                        tasks: completedTasks, isCompletedTasks: true),
                    Gap(20),
                    ElevatedButton(
                      onPressed: () => context.push(RouteLocation.createTask),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(text: 'Add new Task'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  List<Task> _completedTasks(List<Task> tasks, WidgetRef ref){
    final selectedDate = ref.watch(dateProvider);
    final List<Task> filteredTasks = [];
    for(var task in tasks){
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);
      if(isTaskDay && task.isCompleted){
        filteredTasks.add(task);
      }
    }

    return filteredTasks;
  }

  List<Task> _incompleteTasks(List<Task> tasks, WidgetRef ref){
    final selectedDate = ref.watch(dateProvider);
    final List<Task> filteredTasks = [];
    for(var task in tasks){
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);
        if(isTaskDay && !task.isCompleted){
          filteredTasks.add(task);
        }
    }

    return filteredTasks;
  }
}
