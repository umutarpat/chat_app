import 'package:chat_app/global/domain/entities/database/database.dart';
import 'package:chat_app/global/domain/entities/get_current_user_result.dart';
import 'package:chat_app/global/utils/logger.dart';
import 'package:chat_app/modules/chat/data/models/user_list_model/user_list_model.dart';
import 'package:chat_app/modules/todo/data/models/todo_model/todo_model.dart';
import 'package:chat_app/modules/todo/domain/entities/create_todo_result.dart';
import 'package:chat_app/modules/todo/domain/entities/delete_todo_result.dart';
import 'package:chat_app/modules/todo/domain/entities/get_todos_result.dart';
import 'package:chat_app/modules/todo/domain/entities/update_todo_result.dart';
import 'package:chat_app/modules/todo/domain/repositories/todo_repository_interface.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TodoRepositoryInterface)
class TodoRepository implements TodoRepositoryInterface {
  final AppDatabase database;

  TodoRepository(this.database);

  @override
  Future<GetCurrentLoggedInUserResult> getCurrentLoggedUser() async {
    try {
      final result = await (database.select(
        database.usersTable,
      )..where((u) => u.id.equals(1))).getSingleOrNull();

      if (result == null) {
        return GetCurrentLoggedInUserFailure();
      }

      return GetCurrentLoggedInUserSuccess(
        currentLoggedInUser: UserListModel(
          id: result.id,
          firstName: result.firstName,
          lastName: result.lastName,
          email: result.email,
        ),
      );
    } catch (e) {
      logIt().e("Error fetching current logged user: $e");
      return GetCurrentLoggedInUserFailure();
    }
  }

  @override
  Future<GetTodosResult> getTodos({required int userId}) async {
    try {
      final result =
          await (database.select(database.todosTable)
                ..where((todo) => todo.userId.equals(userId))
                ..orderBy([(todo) => OrderingTerm.desc(todo.createdAt)]))
              .get();

      final todos = result.map((e) => TodoModel.fromJson(e.toJson())).toList();

      logIt().d("Todos fetched for user $userId: $todos");
      return GetTodosSuccess(todos: todos);
    } catch (e) {
      logIt().e("Error fetching todos for user $userId: $e");
      return GetTodosFailure();
    }
  }

  @override
  Future<CreateTodoResult> createTodo({
    required String title,
    String? description,
    required int userId,
  }) async {
    try {
      await database
          .into(database.todosTable)
          .insert(
            TodosTableCompanion.insert(
              title: title,
              description: Value(description),
              userId: userId,
            ),
          );

      logIt().d("Todo created successfully");
      return CreateTodoSuccess();
    } catch (e) {
      logIt().e("Error creating todo: $e");
      return CreateTodoFailure();
    }
  }

  @override
  Future<UpdateTodoResult> updateTodo({
    required int id,
    String? title,
    String? description,
    bool? isCompleted,
  }) async {
    try {
      await (database.update(
        database.todosTable,
      )..where((t) => t.id.equals(id))).write(
        TodosTableCompanion(
          title: title != null ? Value(title) : const Value.absent(),
          description: description != null
              ? Value(description)
              : const Value.absent(),
          isCompleted: isCompleted != null
              ? Value(isCompleted)
              : const Value.absent(),
          updatedAt: Value(DateTime.now()),
        ),
      );

      logIt().d("Todo updated successfully");
      return UpdateTodoSuccess();
    } catch (e) {
      logIt().e("Error updating todo: $e");
      return UpdateTodoFailure();
    }
  }

  @override
  Future<DeleteTodoResult> deleteTodo({required int id}) async {
    try {
      await (database.delete(
        database.todosTable,
      )..where((t) => t.id.equals(id))).go();

      logIt().d("Todo deleted successfully");
      return DeleteTodoSuccess();
    } catch (e) {
      logIt().e("Error deleting todo: $e");
      return DeleteTodoFailure();
    }
  }
}
