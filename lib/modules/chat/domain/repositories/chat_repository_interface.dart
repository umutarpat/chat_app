import 'package:chat_app/modules/chat/domain/entities/fetch_user_result.dart';

abstract class ChatRepositoryInterface {
  Future<FetchUserResult> fetchUserList();
}
