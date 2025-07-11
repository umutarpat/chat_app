import 'package:chat_app/global/domain/entities/database/database.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  AppDatabase provideAppDatabase() => AppDatabase();
}
