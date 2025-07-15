import 'package:chat_app/global/domain/entities/get_current_user_result.dart';
import 'package:chat_app/modules/todo/domain/entities/create_todo_result.dart';
import 'package:chat_app/modules/todo/domain/entities/delete_todo_result.dart';
import 'package:chat_app/modules/todo/domain/entities/get_todos_result.dart';
import 'package:chat_app/modules/todo/domain/entities/update_todo_result.dart';

abstract class TodoRepositoryInterface {
  Future<GetCurrentLoggedInUserResult> getCurrentLoggedUser();
  Future<GetTodosResult> getTodos({required int userId});
  Future<CreateTodoResult> createTodo({
    required String title,
    String? description,
    required int userId,
  });
  Future<UpdateTodoResult> updateTodo({
    required int id,
    String? title,
    String? description,
    bool? isCompleted,
  });
  Future<DeleteTodoResult> deleteTodo({required int id});
}
