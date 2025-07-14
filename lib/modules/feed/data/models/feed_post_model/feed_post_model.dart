import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_post_model.freezed.dart';
part 'feed_post_model.g.dart';

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
class FeedPostModel with _$FeedPostModel {
  factory FeedPostModel({
    int? id,
    String? title,
    String? description,
    String? imagePath,
    int? userId,
    String? firstName,
    String? lastName,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    DateTime? createdAt,
  }) = _FeedPostModel;

  factory FeedPostModel.fromJson(Map<String, dynamic> json) =>
      _$FeedPostModelFromJson(json);
}
