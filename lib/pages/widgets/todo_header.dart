import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_sync/pages/providers/active_todo_count/active_todo_count_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';

class TodoHeader extends ConsumerWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTodoCount = ref.watch(activeTodoCountProvider);
    final todos = ref.watch(todoListProvider);
    return Row(
      children: [
        Text(
          'Todo',
          style: TextStyle(
            fontSize: 36.0,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '$activeTodoCount/${todos.length} items${activeTodoCount != 1 ? "s" : ""} left',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.blue[900],
          ),
        ),
      ],
    );
  }
}
