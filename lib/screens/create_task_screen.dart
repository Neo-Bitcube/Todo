import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo/config/routes/route_location.dart';
import 'package:todo/data/data.dart';
import 'package:todo/providers/category_provider.dart';
import 'package:todo/providers/date_provider.dart';
import 'package:todo/providers/providers.dart';
import 'package:todo/providers/time_provider.dart';
import 'package:todo/utils/app_alerts.dart';
import 'package:todo/utils/helpers.dart';
import 'package:todo/widgets/common_text_field.dart';
import 'package:todo/widgets/display_white_text.dart';
import 'package:todo/widgets/select_category.dart';
import 'package:todo/widgets/select_date_time.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen>{
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose(){
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: DisplayWhiteText(text: 'Add New Task')),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Gap(10),
              CommonTextField(
                  title: 'Task Title',
                  hintText: 'Task Hint',
                  controller: _titleController,
              ),
              const SelectCategory(),
              const SelectDateTime(),
              const Gap(16),
              CommonTextField(
                  title: 'hey',
                  hintText: 'yolo',
                  maxLines: 6,
                  controller: _noteController,
              ),
              const Gap(60),
              ElevatedButton(
                onPressed: _createTask,
                child: DisplayWhiteText(text: 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createTask()async{
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);


    if(title.isNotEmpty){
      final task = Task(
          title: title,
          note: note,
          time: Helpers.timeToString(time),
          date: DateFormat.yMMMd().format(date),
          isCompleted: false,
          category: category
      );
      
      await ref.read(taskProvider.notifier).createTask(task).then((value){
        AppAlerts.dislplaySnackBar(context, 'Task created successfully');
        context.go(RouteLocation.home);
      });
    }
    else{
      AppAlerts.dislplaySnackBar(context, 'Task Title cannot be empty');
    }
  }
}


