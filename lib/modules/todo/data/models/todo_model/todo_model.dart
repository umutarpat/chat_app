import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

DateTime? _dateTimeFromJson(dynamic value) {
  if (value == null) return null;
  if (value is String) return DateTime.parse(value);
  if (value is int) return DateTime.fromMillisecondsSinceEpoch(value);
  return null;
}

dynamic _dateTimeToJson(DateTime? dateTime) {
  return dateTime?.toIso8601String();
}

@freezed
class TodoModel with _$TodoModel {
  factory TodoModel({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    int? userId,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    DateTime? createdAt,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    DateTime? updatedAt,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}
