// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserListModelImpl _$$UserListModelImplFromJson(Map<String, dynamic> json) =>
    _$UserListModelImpl(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$UserListModelImplToJson(_$UserListModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };
