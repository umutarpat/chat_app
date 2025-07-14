import 'package:chat_app/modules/feed/domain/repositories/feed_repository_interface.dart';
import 'package:injectable/injectable.dart';

@injectable
class FeedBlocGetFeedUseCase {
  final FeedRepositoryInterface repository;

  FeedBlocGetFeedUseCase(this.repository);

  Future<void> call() async {
    return await repository.getFeed();
  }
}
