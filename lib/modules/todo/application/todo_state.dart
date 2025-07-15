import 'package:chat_app/global/domain/entities/get_current_user_result.dart';
import 'package:chat_app/modules/chat/data/models/user_list_model/user_list_model.dart';
import 'package:chat_app/modules/todo/data/models/todo_model/todo_model.dart';
import 'package:chat_app/modules/todo/domain/entities/create_todo_result.dart';
import 'package:chat_app/modules/todo/domain/entities/delete_todo_result.dart';
import 'package:chat_app/modules/todo/domain/entities/get_todos_result.dart';
import 'package:chat_app/modules/todo/domain/entities/update_todo_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.freezed.dart';

@freezed
abstract class TodoBlocState with _$TodoBlocState {
  factory TodoBlocState({
    GetCurrentLoggedInUserResult? getCurrentLoggedInUserResult,
    UserListModel? currentLoggedInUser,
    GetTodosResult? getTodosResult,
    List<TodoModel>? todos,
    CreateTodoResult? createTodoResult,
    UpdateTodoResult? updateTodoResult,
    DeleteTodoResult? deleteTodoResult,
  }) = _TodoBlocState;
}
