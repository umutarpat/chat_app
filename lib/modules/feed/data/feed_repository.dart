import 'package:chat_app/global/domain/entities/database/database.dart';
import 'package:chat_app/modules/feed/domain/repositories/feed_repository_interface.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FeedRepositoryInterface)
class FeedRepository extends FeedRepositoryInterface {
  final AppDatabase database;

  FeedRepository(this.database);

  @override
  Future<void> getFeed() async {
    // TODO: implement getFeed
    throw UnimplementedError();
  }
}
