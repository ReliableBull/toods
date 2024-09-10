import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_sync/pages/providers/filtered_todos/filtered_todos_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_item/todo_item_provider.dart';
import 'package:todo_riverpod_sync/pages/widgets/todo_item.dart';

class ShowTodos extends ConsumerWidget {
  const ShowTodos({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredTodos = ref.watch(filteredTodosProvider);
    print(filteredTodos.length);
    return ListView.separated(
        itemBuilder: (context, index) {
          final todo = filteredTodos[index];

          return ProviderScope(
            overrides: [
              todoItemProvider.overrideWithValue(todo),
            ],
            child: const TodoItem(),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(color: Colors.grey);
        },
        itemCount: filteredTodos.length);
  }
}
