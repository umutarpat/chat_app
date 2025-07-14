// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedPostModelImpl _$$FeedPostModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedPostModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      imagePath: json['imagePath'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      createdAt: _dateTimeFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$FeedPostModelImplToJson(_$FeedPostModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imagePath': instance.imagePath,
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'createdAt': _dateTimeToJson(instance.createdAt),
    };
