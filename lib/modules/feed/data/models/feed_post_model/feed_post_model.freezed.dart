// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FeedPostModel _$FeedPostModelFromJson(Map<String, dynamic> json) {
  return _FeedPostModel.fromJson(json);
}

/// @nodoc
mixin _$FeedPostModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get imagePath => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FeedPostModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedPostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedPostModelCopyWith<FeedPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedPostModelCopyWith<$Res> {
  factory $FeedPostModelCopyWith(
    FeedPostModel value,
    $Res Function(FeedPostModel) then,
  ) = _$FeedPostModelCopyWithImpl<$Res, FeedPostModel>;
  @useResult
  $Res call({
    int? id,
    String? title,
    String? description,
    String? imagePath,
    int? userId,
    String? firstName,
    String? lastName,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    DateTime? createdAt,
  });
}

/// @nodoc
class _$FeedPostModelCopyWithImpl<$Res, $Val extends FeedPostModel>
    implements $FeedPostModelCopyWith<$Res> {
  _$FeedPostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedPostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imagePath = freezed,
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            imagePath: freezed == imagePath
                ? _value.imagePath
                : imagePath // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int?,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FeedPostModelImplCopyWith<$Res>
    implements $FeedPostModelCopyWith<$Res> {
  factory _$$FeedPostModelImplCopyWith(
    _$FeedPostModelImpl value,
    $Res Function(_$FeedPostModelImpl) then,
  ) = __$$FeedPostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? title,
    String? description,
    String? imagePath,
    int? userId,
    String? firstName,
    String? lastName,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$FeedPostModelImplCopyWithImpl<$Res>
    extends _$FeedPostModelCopyWithImpl<$Res, _$FeedPostModelImpl>
    implements _$$FeedPostModelImplCopyWith<$Res> {
  __$$FeedPostModelImplCopyWithImpl(
    _$FeedPostModelImpl _value,
    $Res Function(_$FeedPostModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedPostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imagePath = freezed,
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$FeedPostModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        imagePath: freezed == imagePath
            ? _value.imagePath
            : imagePath // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int?,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedPostModelImpl implements _FeedPostModel {
  _$FeedPostModelImpl({
    this.id,
    this.title,
    this.description,
    this.imagePath,
    this.userId,
    this.firstName,
    this.lastName,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    this.createdAt,
  });

  factory _$FeedPostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedPostModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? imagePath;
  @override
  final int? userId;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'FeedPostModel(id: $id, title: $title, description: $description, imagePath: $imagePath, userId: $userId, firstName: $firstName, lastName: $lastName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedPostModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    imagePath,
    userId,
    firstName,
    lastName,
    createdAt,
  );

  /// Create a copy of FeedPostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedPostModelImplCopyWith<_$FeedPostModelImpl> get copyWith =>
      __$$FeedPostModelImplCopyWithImpl<_$FeedPostModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedPostModelImplToJson(this);
  }
}

abstract class _FeedPostModel implements FeedPostModel {
  factory _FeedPostModel({
    final int? id,
    final String? title,
    final String? description,
    final String? imagePath,
    final int? userId,
    final String? firstName,
    final String? lastName,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    final DateTime? createdAt,
  }) = _$FeedPostModelImpl;

  factory _FeedPostModel.fromJson(Map<String, dynamic> json) =
      _$FeedPostModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get imagePath;
  @override
  int? get userId;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime? get createdAt;

  /// Create a copy of FeedPostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedPostModelImplCopyWith<_$FeedPostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
