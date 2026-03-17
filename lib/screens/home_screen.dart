import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/config/routes/route_location.dart';
import 'package:todo/data/data.dart';
import 'package:todo/utils/extensions.dart';
import 'package:todo/utils/task_categories.dart';
import 'package:todo/widgets/display_list_of_tasks.dart';
import 'package:todo/widgets/display_white_text.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) => const HomeScreen();
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final colors = context.colorScheme;
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
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DisplayWhiteText(
                          text: 'Mar 10, 2026',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                      ),
                      Gap(10),
                      DisplayWhiteText(
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
                    DisplayListOfTasks(tasks:[
                      Task(title: 'title',
                          note: 'note',
                          time: '11:47',
                          date: 'Mar, 16',
                          isCompleted: false,
                          category: TaskCategories.shopping),
                      Task(title: 'title 2',
                          note: 'note',
                          time: '15:12',
                          date: 'Mar, 16',
                          isCompleted: false,
                          category: TaskCategories.education)
                    ]),
                    const Gap(20),
                    Text('Completed', style: context.textTheme.headlineMedium,),
                    const Gap(20),
                    DisplayListOfTasks(tasks: [
                      Task(title: 'title',
                          note: 'note',
                          time: '11:47',
                          date: 'Mar, 16',
                          isCompleted: true,
                          category: TaskCategories.personal),
                      Task(title: 'title 2',
                          note: 'note',
                          time: '15:12',
                          date: 'Mar, 16',
                          isCompleted: true,
                          category: TaskCategories.work)
                    ],
                      isCompletedTasks: true),
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
}
