sealed class TodoBlocEvent {}

final class GetCurrentLoggedInUserEvent extends TodoBlocEvent {}

final class GetTodosEvent extends TodoBlocEvent {
  final int userId;

  GetTodosEvent({required this.userId});
}

final class CreateTodoEvent extends TodoBlocEvent {
  final String title;
  final String? description;
  final int userId;

  CreateTodoEvent({
    required this.title,
    this.description,
    required this.userId,
  });
}

final class UpdateTodoEvent extends TodoBlocEvent {
  final int id;
  final String? title;
  final String? description;
  final bool? isCompleted;

  UpdateTodoEvent({
    required this.id,
    this.title,
    this.description,
    this.isCompleted,
  });
}

final class DeleteTodoEvent extends TodoBlocEvent {
  final int id;

  DeleteTodoEvent({required this.id});
}
