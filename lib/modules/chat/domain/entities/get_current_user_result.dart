import 'package:chat_app/modules/chat/data/models/user_list_model/user_list_model.dart';

sealed class GetCurrentLoggedInUserResult {}

final class GetCurrentLoggedInUserSuccess extends GetCurrentLoggedInUserResult {
  final UserListModel currentLoggedInUser;

  GetCurrentLoggedInUserSuccess({required this.currentLoggedInUser});
}

final class GetCurrentLoggedInUserFailure
    extends GetCurrentLoggedInUserResult {}
