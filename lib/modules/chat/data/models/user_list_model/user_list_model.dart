import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_model.freezed.dart';
part 'user_list_model.g.dart';

@freezed
class UserListModel with _$UserListModel {
  factory UserListModel({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
  }) = _UserListModel;

  factory UserListModel.fromJson(Map<String, dynamic> json) =>
      _$UserListModelFromJson(json);
}
