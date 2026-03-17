import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo/utils/extensions.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Task Title',
          style: context.textTheme.titleLarge,),
        const Gap(10),
        TextField(
          decoration: InputDecoration(
            hintText: 'Task Title',
          ),
          onChanged: (value){},
        )
      ],
    );
  }
}
