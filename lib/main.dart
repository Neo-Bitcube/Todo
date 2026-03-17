import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/todo_app.dart';

void main() {
  runApp(
    ProviderScope(child: TodoApp()),
  );
}


