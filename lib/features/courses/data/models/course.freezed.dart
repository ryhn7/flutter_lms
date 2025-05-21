// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  List<IdTitle> get chapter => throw _privateConstructorUsedError;
  List<PathFile> get path => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  bool? get isNew => throw _privateConstructorUsedError;
  String? get level => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get instructorImageUrl => throw _privateConstructorUsedError;
  String? get instructorFlag => throw _privateConstructorUsedError;

  /// Serializes this Course to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? author,
      String? category,
      List<IdTitle> chapter,
      List<PathFile> path,
      String title,
      String createdAt,
      String? duration,
      bool? isNew,
      String? level,
      String? description,
      List<String>? tags,
      String? thumbnailUrl,
      String? instructorImageUrl,
      String? instructorFlag});
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = freezed,
    Object? category = freezed,
    Object? chapter = null,
    Object? path = null,
    Object? title = null,
    Object? createdAt = null,
    Object? duration = freezed,
    Object? isNew = freezed,
    Object? level = freezed,
    Object? description = freezed,
    Object? tags = freezed,
    Object? thumbnailUrl = freezed,
    Object? instructorImageUrl = freezed,
    Object? instructorFlag = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as List<IdTitle>,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as List<PathFile>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      isNew: freezed == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorImageUrl: freezed == instructorImageUrl
          ? _value.instructorImageUrl
          : instructorImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorFlag: freezed == instructorFlag
          ? _value.instructorFlag
          : instructorFlag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseImplCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$CourseImplCopyWith(
          _$CourseImpl value, $Res Function(_$CourseImpl) then) =
      __$$CourseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String? author,
      String? category,
      List<IdTitle> chapter,
      List<PathFile> path,
      String title,
      String createdAt,
      String? duration,
      bool? isNew,
      String? level,
      String? description,
      List<String>? tags,
      String? thumbnailUrl,
      String? instructorImageUrl,
      String? instructorFlag});
}

/// @nodoc
class __$$CourseImplCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$CourseImpl>
    implements _$$CourseImplCopyWith<$Res> {
  __$$CourseImplCopyWithImpl(
      _$CourseImpl _value, $Res Function(_$CourseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = freezed,
    Object? category = freezed,
    Object? chapter = null,
    Object? path = null,
    Object? title = null,
    Object? createdAt = null,
    Object? duration = freezed,
    Object? isNew = freezed,
    Object? level = freezed,
    Object? description = freezed,
    Object? tags = freezed,
    Object? thumbnailUrl = freezed,
    Object? instructorImageUrl = freezed,
    Object? instructorFlag = freezed,
  }) {
    return _then(_$CourseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      chapter: null == chapter
          ? _value._chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as List<IdTitle>,
      path: null == path
          ? _value._path
          : path // ignore: cast_nullable_to_non_nullable
              as List<PathFile>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      isNew: freezed == isNew
          ? _value.isNew
          : isNew // ignore: cast_nullable_to_non_nullable
              as bool?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      thumbnailUrl: freezed == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorImageUrl: freezed == instructorImageUrl
          ? _value.instructorImageUrl
          : instructorImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      instructorFlag: freezed == instructorFlag
          ? _value.instructorFlag
          : instructorFlag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseImpl implements _Course {
  _$CourseImpl(
      {@JsonKey(name: '_id') required this.id,
      this.author,
      this.category,
      required final List<IdTitle> chapter,
      required final List<PathFile> path,
      required this.title,
      required this.createdAt,
      this.duration,
      this.isNew,
      this.level,
      this.description,
      final List<String>? tags,
      this.thumbnailUrl,
      this.instructorImageUrl,
      this.instructorFlag})
      : _chapter = chapter,
        _path = path,
        _tags = tags;

  factory _$CourseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String? author;
  @override
  final String? category;
  final List<IdTitle> _chapter;
  @override
  List<IdTitle> get chapter {
    if (_chapter is EqualUnmodifiableListView) return _chapter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapter);
  }

  final List<PathFile> _path;
  @override
  List<PathFile> get path {
    if (_path is EqualUnmodifiableListView) return _path;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_path);
  }

  @override
  final String title;
  @override
  final String createdAt;
  @override
  final String? duration;
  @override
  final bool? isNew;
  @override
  final String? level;
  @override
  final String? description;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? thumbnailUrl;
  @override
  final String? instructorImageUrl;
  @override
  final String? instructorFlag;

  @override
  String toString() {
    return 'Course(id: $id, author: $author, category: $category, chapter: $chapter, path: $path, title: $title, createdAt: $createdAt, duration: $duration, isNew: $isNew, level: $level, description: $description, tags: $tags, thumbnailUrl: $thumbnailUrl, instructorImageUrl: $instructorImageUrl, instructorFlag: $instructorFlag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._chapter, _chapter) &&
            const DeepCollectionEquality().equals(other._path, _path) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.isNew, isNew) || other.isNew == isNew) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.instructorImageUrl, instructorImageUrl) ||
                other.instructorImageUrl == instructorImageUrl) &&
            (identical(other.instructorFlag, instructorFlag) ||
                other.instructorFlag == instructorFlag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      author,
      category,
      const DeepCollectionEquality().hash(_chapter),
      const DeepCollectionEquality().hash(_path),
      title,
      createdAt,
      duration,
      isNew,
      level,
      description,
      const DeepCollectionEquality().hash(_tags),
      thumbnailUrl,
      instructorImageUrl,
      instructorFlag);

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      __$$CourseImplCopyWithImpl<_$CourseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseImplToJson(
      this,
    );
  }
}

abstract class _Course implements Course {
  factory _Course(
      {@JsonKey(name: '_id') required final String id,
      final String? author,
      final String? category,
      required final List<IdTitle> chapter,
      required final List<PathFile> path,
      required final String title,
      required final String createdAt,
      final String? duration,
      final bool? isNew,
      final String? level,
      final String? description,
      final List<String>? tags,
      final String? thumbnailUrl,
      final String? instructorImageUrl,
      final String? instructorFlag}) = _$CourseImpl;

  factory _Course.fromJson(Map<String, dynamic> json) = _$CourseImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String? get author;
  @override
  String? get category;
  @override
  List<IdTitle> get chapter;
  @override
  List<PathFile> get path;
  @override
  String get title;
  @override
  String get createdAt;
  @override
  String? get duration;
  @override
  bool? get isNew;
  @override
  String? get level;
  @override
  String? get description;
  @override
  List<String>? get tags;
  @override
  String? get thumbnailUrl;
  @override
  String? get instructorImageUrl;
  @override
  String? get instructorFlag;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
