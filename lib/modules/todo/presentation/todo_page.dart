import 'package:chat_app/global/common/bottom_nav_bar.dart';
import 'package:chat_app/global/core/routes.dart';
import 'package:chat_app/global/domain/entities/get_current_user_result.dart';
import 'package:chat_app/l10n/app_localizations.dart';
import 'package:chat_app/modules/todo/application/todo_bloc.dart';
import 'package:chat_app/modules/todo/application/todo_event.dart';
import 'package:chat_app/modules/todo/application/todo_state.dart';
import 'package:chat_app/modules/todo/domain/entities/get_todos_result.dart';
import 'package:chat_app/modules/todo/presentation/widgets/new_todo_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final Map<int, TextEditingController> _titleControllers = {};
  final Map<int, TextEditingController> _descriptionControllers = {};
  final Map<int, bool> _isEditingMap = {};

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoBloc>(context).add(GetCurrentLoggedInUserEvent());
  }

  @override
  void dispose() {
    for (final controller in _titleControllers.values) {
      controller.dispose();
    }
    for (final controller in _descriptionControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _startEditing(int todoId, String title, String? description) {
    setState(() {
      _isEditingMap[todoId] = true;
      _titleControllers[todoId] = TextEditingController(text: title);
      _descriptionControllers[todoId] = TextEditingController(
        text: description ?? '',
      );
    });
  }

  void _stopEditing(int todoId) {
    setState(() {
      _isEditingMap[todoId] = false;
      _titleControllers[todoId]?.dispose();
      _descriptionControllers[todoId]?.dispose();
      _titleControllers.remove(todoId);
      _descriptionControllers.remove(todoId);
    });
  }

  void _saveChanges(int todoId) {
    final titleController = _titleControllers[todoId];
    final descriptionController = _descriptionControllers[todoId];

    if (titleController != null && titleController.text.isNotEmpty) {
      context.read<TodoBloc>().add(
        UpdateTodoEvent(
          id: todoId,
          title: titleController.text,
          description: descriptionController?.text.isEmpty == true
              ? null
              : descriptionController?.text,
        ),
      );
    }
    _stopEditing(todoId);
  }

  void _toggleCompletion(int todoId, bool isCompleted) {
    context.read<TodoBloc>().add(
      UpdateTodoEvent(id: todoId, isCompleted: !isCompleted),
    );

    Future.delayed(const Duration(seconds: 2), () {
      context.read<TodoBloc>().add(DeleteTodoEvent(id: todoId));
    });
  }

  void _deleteTodo(int todoId) {
    context.read<TodoBloc>().add(DeleteTodoEvent(id: todoId));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.todo,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed('/${AppRoute.settings.name}');
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocConsumer<TodoBloc, TodoBlocState>(
        listenWhen: (previous, current) {
          if (previous.getCurrentLoggedInUserResult
                  is! GetCurrentLoggedInUserSuccess &&
              current.getCurrentLoggedInUserResult
                  is GetCurrentLoggedInUserSuccess) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          if (state.getCurrentLoggedInUserResult
              is GetCurrentLoggedInUserSuccess) {
            context.read<TodoBloc>().add(
              GetTodosEvent(userId: state.currentLoggedInUser!.id!),
            );
          }
        },
        builder: (context, state) {
          if (state.getTodosResult is GetTodosSuccess) {
            final todos = state.todos ?? [];

            if (todos.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.noTodosYet,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                if (state.currentLoggedInUser?.id != null) {
                  context.read<TodoBloc>().add(
                    GetTodosEvent(userId: state.currentLoggedInUser!.id!),
                  );
                }
              },
              child: ListView.builder(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 64,
                ),
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  final isEditing = _isEditingMap[todo.id] ?? false;
                  final isCompleted = todo.isCompleted ?? false;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Checkbox(
                        value: isCompleted,
                        onChanged: (value) {
                          _toggleCompletion(todo.id!, isCompleted);
                        },
                      ),
                      title: isEditing
                          ? TextField(
                              controller: _titleControllers[todo.id],
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                              ),
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                              onSubmitted: (_) => _saveChanges(todo.id!),
                            )
                          : GestureDetector(
                              onTap: () => _startEditing(
                                todo.id!,
                                todo.title ?? '',
                                todo.description,
                              ),
                              child: Text(
                                todo.title ?? '',
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      decoration: isCompleted
                                          ? TextDecoration.lineThrough
                                          : null,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                              ),
                            ),
                      subtitle:
                          todo.description != null &&
                              todo.description!.isNotEmpty
                          ? (isEditing
                                ? TextField(
                                    controller:
                                        _descriptionControllers[todo.id],
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                    ),
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleSmall,
                                    maxLines: 2,
                                    onSubmitted: (_) => _saveChanges(todo.id!),
                                  )
                                : GestureDetector(
                                    onTap: () => _startEditing(
                                      todo.id!,
                                      todo.title ?? '',
                                      todo.description,
                                    ),
                                    child: Text(
                                      todo.description!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            decoration: isCompleted
                                                ? TextDecoration.lineThrough
                                                : null,
                                          ),
                                    ),
                                  ))
                          : null,
                      trailing: isEditing
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () => _saveChanges(todo.id!),
                                  icon: const Icon(Icons.check),
                                  color: Theme.of(context).primaryColor,
                                ),
                                IconButton(
                                  onPressed: () => _stopEditing(todo.id!),
                                  icon: const Icon(Icons.close),
                                  color: Colors.red,
                                ),
                              ],
                            )
                          : IconButton(
                              onPressed: () => _deleteTodo(todo.id!),
                              icon: const Icon(Icons.delete_outline),
                              color: Theme.of(context).colorScheme.error,
                            ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final todoBloc = context.read<TodoBloc>();

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (bottomSheetContext) {
              return BlocProvider.value(
                value: todoBloc,
                child: const TodoPageNewTodoSheet(),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}
