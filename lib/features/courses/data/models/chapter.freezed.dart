// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Chapter _$ChapterFromJson(Map<String, dynamic> json) {
  return _Chapter.fromJson(json);
}

/// @nodoc
mixin _$Chapter {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  List<IdTitle> get coursesId => throw _privateConstructorUsedError;
  List<IdTitle> get lesson => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Chapter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapterCopyWith<Chapter> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterCopyWith<$Res> {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) then) =
      _$ChapterCopyWithImpl<$Res, Chapter>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      List<IdTitle> coursesId,
      List<IdTitle> lesson,
      String title,
      String createdAt});
}

/// @nodoc
class _$ChapterCopyWithImpl<$Res, $Val extends Chapter>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? coursesId = null,
    Object? lesson = null,
    Object? title = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      coursesId: null == coursesId
          ? _value.coursesId
          : coursesId // ignore: cast_nullable_to_non_nullable
              as List<IdTitle>,
      lesson: null == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as List<IdTitle>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterImplCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$$ChapterImplCopyWith(
          _$ChapterImpl value, $Res Function(_$ChapterImpl) then) =
      __$$ChapterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      List<IdTitle> coursesId,
      List<IdTitle> lesson,
      String title,
      String createdAt});
}

/// @nodoc
class __$$ChapterImplCopyWithImpl<$Res>
    extends _$ChapterCopyWithImpl<$Res, _$ChapterImpl>
    implements _$$ChapterImplCopyWith<$Res> {
  __$$ChapterImplCopyWithImpl(
      _$ChapterImpl _value, $Res Function(_$ChapterImpl) _then)
      : super(_value, _then);

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? coursesId = null,
    Object? lesson = null,
    Object? title = null,
    Object? createdAt = null,
  }) {
    return _then(_$ChapterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      coursesId: null == coursesId
          ? _value._coursesId
          : coursesId // ignore: cast_nullable_to_non_nullable
              as List<IdTitle>,
      lesson: null == lesson
          ? _value._lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as List<IdTitle>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterImpl implements _Chapter {
  _$ChapterImpl(
      {@JsonKey(name: '_id') required this.id,
      required final List<IdTitle> coursesId,
      required final List<IdTitle> lesson,
      required this.title,
      required this.createdAt})
      : _coursesId = coursesId,
        _lesson = lesson;

  factory _$ChapterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  final List<IdTitle> _coursesId;
  @override
  List<IdTitle> get coursesId {
    if (_coursesId is EqualUnmodifiableListView) return _coursesId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coursesId);
  }

  final List<IdTitle> _lesson;
  @override
  List<IdTitle> get lesson {
    if (_lesson is EqualUnmodifiableListView) return _lesson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lesson);
  }

  @override
  final String title;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'Chapter(id: $id, coursesId: $coursesId, lesson: $lesson, title: $title, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._coursesId, _coursesId) &&
            const DeepCollectionEquality().equals(other._lesson, _lesson) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_coursesId),
      const DeepCollectionEquality().hash(_lesson),
      title,
      createdAt);

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterImplCopyWith<_$ChapterImpl> get copyWith =>
      __$$ChapterImplCopyWithImpl<_$ChapterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterImplToJson(
      this,
    );
  }
}

abstract class _Chapter implements Chapter {
  factory _Chapter(
      {@JsonKey(name: '_id') required final String id,
      required final List<IdTitle> coursesId,
      required final List<IdTitle> lesson,
      required final String title,
      required final String createdAt}) = _$ChapterImpl;

  factory _Chapter.fromJson(Map<String, dynamic> json) = _$ChapterImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  List<IdTitle> get coursesId;
  @override
  List<IdTitle> get lesson;
  @override
  String get title;
  @override
  String get createdAt;

  /// Create a copy of Chapter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterImplCopyWith<_$ChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
