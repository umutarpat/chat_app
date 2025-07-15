import 'package:chat_app/global/domain/entities/get_current_user_result.dart';
import 'package:chat_app/modules/todo/domain/entities/create_todo_result.dart';
import 'package:chat_app/modules/todo/domain/entities/delete_todo_result.dart';
import 'package:chat_app/modules/todo/domain/entities/get_todos_result.dart';
import 'package:chat_app/modules/todo/domain/entities/update_todo_result.dart';
import 'package:chat_app/modules/todo/domain/repositories/todo_repository_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class TodoBlocGetCurrentLoggedUserUseCase {
  final TodoRepositoryInterface repository;

  TodoBlocGetCurrentLoggedUserUseCase(this.repository);

  Future<GetCurrentLoggedInUserResult> call() async {
    return await repository.getCurrentLoggedUser();
  }
}

@injectable
class TodoBlocGetTodosUseCase {
  final TodoRepositoryInterface repository;

  TodoBlocGetTodosUseCase(this.repository);

  Future<GetTodosResult> call({required int userId}) async {
    return await repository.getTodos(userId: userId);
  }
}

@injectable
class TodoBlocCreateTodoUseCase {
  final TodoRepositoryInterface repository;

  TodoBlocCreateTodoUseCase(this.repository);

  Future<CreateTodoResult> call({
    required String title,
    String? description,
    required int userId,
  }) async {
    return await repository.createTodo(
      title: title,
      description: description,
      userId: userId,
    );
  }
}

@injectable
class TodoBlocUpdateTodoUseCase {
  final TodoRepositoryInterface repository;

  TodoBlocUpdateTodoUseCase(this.repository);

  Future<UpdateTodoResult> call({
    required int id,
    String? title,
    String? description,
    bool? isCompleted,
  }) async {
    return await repository.updateTodo(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
    );
  }
}

@injectable
class TodoBlocDeleteTodoUseCase {
  final TodoRepositoryInterface repository;

  TodoBlocDeleteTodoUseCase(this.repository);

  Future<DeleteTodoResult> call({required int id}) async {
    return await repository.deleteTodo(id: id);
  }
}
