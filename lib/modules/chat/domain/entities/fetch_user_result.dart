import 'package:chat_app/modules/chat/data/models/user_list_model/user_list_model.dart';

sealed class FetchUserResult {}

final class FetchUserSuccess extends FetchUserResult {
  final List<UserListModel> userList;

  FetchUserSuccess({required this.userList});
}

final class FetchUserFailure extends FetchUserResult {}
