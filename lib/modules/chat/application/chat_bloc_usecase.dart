import 'package:chat_app/modules/chat/domain/entities/fetch_user_result.dart';
import 'package:chat_app/modules/chat/domain/repositories/chat_repository_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatBlocFetchUserListUseCase {
  final ChatRepositoryInterface repository;

  ChatBlocFetchUserListUseCase(this.repository);

  Future<FetchUserResult> call() async {
    return await repository.fetchUserList();
  }
}
