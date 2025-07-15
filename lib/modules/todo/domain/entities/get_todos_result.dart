import 'package:chat_app/modules/todo/data/models/todo_model/todo_model.dart';

sealed class GetTodosResult {}

final class GetTodosSuccess extends GetTodosResult {
  final List<TodoModel> todos;

  GetTodosSuccess({required this.todos});
}

final class GetTodosFailure extends GetTodosResult {}
