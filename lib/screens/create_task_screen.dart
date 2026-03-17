import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/widgets/common_text_field.dart';
import 'package:todo/widgets/display_white_text.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
  CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DisplayWhiteText(text: 'Add New Task'),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            CommonTextField(),
          ],
        ),
      ),
    );
  }
}
