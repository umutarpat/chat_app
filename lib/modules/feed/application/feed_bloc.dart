import 'package:chat_app/modules/feed/application/feed_bloc_event.dart';
import 'package:chat_app/modules/feed/application/feed_bloc_state.dart';
import 'package:chat_app/modules/feed/application/feed_bloc_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FeedBloc extends Bloc<FeedBlocEvent, FeedBlocState> {
  final FeedBlocGetFeedUseCase getFeedUseCase;

  FeedBloc({required this.getFeedUseCase}) : super(FeedBlocState()) {
    on<GetFeedEvent>((event, emit) async {
      // emit(FeedBlocState());
    });
  }
}
