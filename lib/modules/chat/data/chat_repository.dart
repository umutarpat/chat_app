import 'package:chat_app/global/domain/entities/database/database.dart';
import 'package:chat_app/global/utils/logger.dart';
import 'package:chat_app/modules/chat/data/models/user_list_model/user_list_model.dart';
import 'package:chat_app/modules/chat/domain/entities/fetch_user_result.dart';
import 'package:chat_app/modules/chat/domain/repositories/chat_repository_interface.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatRepositoryInterface)
class ChatRepository extends ChatRepositoryInterface {
  final AppDatabase database;

  ChatRepository(this.database);

  @override
  Future<FetchUserResult> fetchUserList() async {
    try {
      final result = await (database.select(
        database.usersTable,
      )..where((u) => u.id.equals(2))).get();

      final userList = result
          .map((e) => UserListModel.fromJson(e.toJson()))
          .toList();

      logIt().d("User list: $result");
      return FetchUserSuccess(userList: userList);
    } catch (e) {
      logIt().e("Error fetching user list: $e");
      return FetchUserFailure();
    }
  }
}
