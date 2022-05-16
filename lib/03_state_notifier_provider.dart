import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// StateNotifierProvider
///
/// 状態を格納し、その状態を変更・公開することが可能なメソッドを実装可能なProvider
/// StateProviderを使うとWidget側に状態変更のコードが増えてしまうが、
/// StateNotifierProviderを使えば状態に関するロジックを閉じ込めることが可能
final todoListNotifierProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>(
  (_) => TodoListNotifier(),
);

class Todo {
  Todo({
    required this.id,
    required this.title,
    this.completed = false,
  });
  final String id;
  final String title;
  final bool completed;
}

class TodoListNotifier extends StateNotifier<List<Todo>> {
  /// コンストラクタのsuperでStateの初期位を設定可能
  TodoListNotifier() : super([]);

  void add(Todo todo) {
    state = [...state, todo];
  }

  void remove(String removedTodoId) {
    state = [
      for (final todo in state)
        if (todo.id != removedTodoId) todo,
    ];
  }

  void toggle(String toggledTodoId) {
    state = [
      for (final todo in state)
        if (todo.id == toggledTodoId)
          Todo(
            id: todo.id,
            title: todo.title,
            completed: !todo.completed,
          )
        else
          todo,
    ];
  }
}

class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// watchでProviderを読み取る
    /// .notifier をつけると StateNotifierProvider が取得できる
    /// 何もつけなければ state(=値) が取得できる
    final todoList = ref.watch(todoListNotifierProvider);
    final notifier = ref.watch(todoListNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifierProvider'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            child: const Text('Add'),
            onPressed: () {
              final notifier = ref.read(todoListNotifierProvider.notifier);
              final id = todoList.length + 1;
              notifier.add(
                Todo(id: '$id', title: 'タイトル: $id'),
              );
            },
          ),
          for (final todo in todoList)
            ListTile(
              leading: todo.completed
                  ? const Icon(Icons.check_box)
                  : const Icon(Icons.square_outlined),
              title: Text(todo.title),
              onTap: () {
                /// メソッドを使うときはread使った方がListenしなくて良いのでパフォーマンスが良い
                final notifier = ref.read(todoListNotifierProvider.notifier);
                notifier.toggle(todo.id);
              },
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: () {
                  final notifier = ref.read(todoListNotifierProvider.notifier);
                  notifier.remove(todo.id);
                },
              ),
            )
        ],
      ),
    );
  }
}
