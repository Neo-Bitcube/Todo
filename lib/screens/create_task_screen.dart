import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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
              CommonTextField(title: 'Task Title', hintText: 'Task Hint'),
              const SelectCategory(),
              const SelectDateTime(),
              const Gap(16),
              CommonTextField(title: 'hey', hintText: 'yolo', maxLines: 6),
              const Gap(60),
              ElevatedButton(
                onPressed: () {},
                child: DisplayWhiteText(text: 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


