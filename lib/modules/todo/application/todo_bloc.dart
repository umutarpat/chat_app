import 'package:chat_app/global/domain/entities/get_current_user_result.dart';
import 'package:chat_app/modules/todo/application/todo_bloc_usecase.dart';
import 'package:chat_app/modules/todo/application/todo_event.dart';
import 'package:chat_app/modules/todo/application/todo_state.dart';
import 'package:chat_app/modules/todo/domain/entities/create_todo_result.dart';
import 'package:chat_app/modules/todo/domain/entities/delete_todo_result.dart';
import 'package:chat_app/modules/todo/domain/entities/get_todos_result.dart';
import 'package:chat_app/modules/todo/domain/entities/update_todo_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TodoBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  final TodoBlocGetCurrentLoggedUserUseCase getCurrentLoggedUserUseCase;
  final TodoBlocGetTodosUseCase getTodosUseCase;
  final TodoBlocCreateTodoUseCase createTodoUseCase;
  final TodoBlocUpdateTodoUseCase updateTodoUseCase;
  final TodoBlocDeleteTodoUseCase deleteTodoUseCase;

  TodoBloc({
    required this.getCurrentLoggedUserUseCase,
    required this.getTodosUseCase,
    required this.createTodoUseCase,
    required this.updateTodoUseCase,
    required this.deleteTodoUseCase,
  }) : super(TodoBlocState()) {
    on<GetCurrentLoggedInUserEvent>((event, emit) async {
      final result = await getCurrentLoggedUserUseCase.call();
      if (result is GetCurrentLoggedInUserSuccess) {
        emit(
          state.copyWith(
            getCurrentLoggedInUserResult: result,
            currentLoggedInUser: result.currentLoggedInUser,
          ),
        );
      } else {
        emit(state.copyWith(getCurrentLoggedInUserResult: result));
      }
    });

    on<GetTodosEvent>((event, emit) async {
      final result = await getTodosUseCase.call(userId: event.userId);
      if (result is GetTodosSuccess) {
        emit(state.copyWith(getTodosResult: result, todos: result.todos));
      } else {
        emit(state.copyWith(getTodosResult: result));
      }
    });

    on<CreateTodoEvent>((event, emit) async {
      final result = await createTodoUseCase.call(
        title: event.title,
        description: event.description,
        userId: event.userId,
      );

      if (result is CreateTodoSuccess) {
        emit(state.copyWith(createTodoResult: result));
        // Refresh the todos after creating a new one
        if (state.currentLoggedInUser?.id != null) {
          add(GetTodosEvent(userId: state.currentLoggedInUser!.id!));
        }
      } else {
        emit(state.copyWith(createTodoResult: result));
      }
    });

    on<UpdateTodoEvent>((event, emit) async {
      final result = await updateTodoUseCase.call(
        id: event.id,
        title: event.title,
        description: event.description,
        isCompleted: event.isCompleted,
      );

      if (result is UpdateTodoSuccess) {
        emit(state.copyWith(updateTodoResult: result));
        // Refresh the todos after updating
        if (state.currentLoggedInUser?.id != null) {
          add(GetTodosEvent(userId: state.currentLoggedInUser!.id!));
        }
      } else {
        emit(state.copyWith(updateTodoResult: result));
      }
    });

    on<DeleteTodoEvent>((event, emit) async {
      final result = await deleteTodoUseCase.call(id: event.id);

      if (result is DeleteTodoSuccess) {
        emit(state.copyWith(deleteTodoResult: result));
        // Refresh the todos after deleting
        if (state.currentLoggedInUser?.id != null) {
          add(GetTodosEvent(userId: state.currentLoggedInUser!.id!));
        }
      } else {
        emit(state.copyWith(deleteTodoResult: result));
      }
    });
  }
}
