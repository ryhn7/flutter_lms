// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Audio _$AudioFromJson(Map<String, dynamic> json) {
  return _Audio.fromJson(json);
}

/// @nodoc
mixin _$Audio {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get artist => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get languange => throw _privateConstructorUsedError;
  String get isPremium => throw _privateConstructorUsedError;
  List<PathFile> get path => throw _privateConstructorUsedError;
  List<PathFile> get thumbnail => throw _privateConstructorUsedError;

  /// Serializes this Audio to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Audio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioCopyWith<Audio> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioCopyWith<$Res> {
  factory $AudioCopyWith(Audio value, $Res Function(Audio) then) =
      _$AudioCopyWithImpl<$Res, Audio>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String artist,
      String title,
      String? time,
      String createdAt,
      String description,
      String languange,
      String isPremium,
      List<PathFile> path,
      List<PathFile> thumbnail});
}

/// @nodoc
class _$AudioCopyWithImpl<$Res, $Val extends Audio>
    implements $AudioCopyWith<$Res> {
  _$AudioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Audio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? artist = null,
    Object? title = null,
    Object? time = freezed,
    Object? createdAt = null,
    Object? description = null,
    Object? languange = null,
    Object? isPremium = null,
    Object? path = null,
    Object? thumbnail = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      languange: null == languange
          ? _value.languange
          : languange // ignore: cast_nullable_to_non_nullable
              as String,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as List<PathFile>,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as List<PathFile>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioImplCopyWith<$Res> implements $AudioCopyWith<$Res> {
  factory _$$AudioImplCopyWith(
          _$AudioImpl value, $Res Function(_$AudioImpl) then) =
      __$$AudioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String artist,
      String title,
      String? time,
      String createdAt,
      String description,
      String languange,
      String isPremium,
      List<PathFile> path,
      List<PathFile> thumbnail});
}

/// @nodoc
class __$$AudioImplCopyWithImpl<$Res>
    extends _$AudioCopyWithImpl<$Res, _$AudioImpl>
    implements _$$AudioImplCopyWith<$Res> {
  __$$AudioImplCopyWithImpl(
      _$AudioImpl _value, $Res Function(_$AudioImpl) _then)
      : super(_value, _then);

  /// Create a copy of Audio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? artist = null,
    Object? title = null,
    Object? time = freezed,
    Object? createdAt = null,
    Object? description = null,
    Object? languange = null,
    Object? isPremium = null,
    Object? path = null,
    Object? thumbnail = null,
  }) {
    return _then(_$AudioImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      languange: null == languange
          ? _value.languange
          : languange // ignore: cast_nullable_to_non_nullable
              as String,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value._path
          : path // ignore: cast_nullable_to_non_nullable
              as List<PathFile>,
      thumbnail: null == thumbnail
          ? _value._thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as List<PathFile>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioImpl implements _Audio {
  _$AudioImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.artist,
      required this.title,
      this.time,
      required this.createdAt,
      required this.description,
      required this.languange,
      required this.isPremium,
      required final List<PathFile> path,
      required final List<PathFile> thumbnail})
      : _path = path,
        _thumbnail = thumbnail;

  factory _$AudioImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String artist;
  @override
  final String title;
  @override
  final String? time;
  @override
  final String createdAt;
  @override
  final String description;
  @override
  final String languange;
  @override
  final String isPremium;
  final List<PathFile> _path;
  @override
  List<PathFile> get path {
    if (_path is EqualUnmodifiableListView) return _path;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_path);
  }

  final List<PathFile> _thumbnail;
  @override
  List<PathFile> get thumbnail {
    if (_thumbnail is EqualUnmodifiableListView) return _thumbnail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_thumbnail);
  }

  @override
  String toString() {
    return 'Audio(id: $id, artist: $artist, title: $title, time: $time, createdAt: $createdAt, description: $description, languange: $languange, isPremium: $isPremium, path: $path, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.languange, languange) ||
                other.languange == languange) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            const DeepCollectionEquality().equals(other._path, _path) &&
            const DeepCollectionEquality()
                .equals(other._thumbnail, _thumbnail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      artist,
      title,
      time,
      createdAt,
      description,
      languange,
      isPremium,
      const DeepCollectionEquality().hash(_path),
      const DeepCollectionEquality().hash(_thumbnail));

  /// Create a copy of Audio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioImplCopyWith<_$AudioImpl> get copyWith =>
      __$$AudioImplCopyWithImpl<_$AudioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioImplToJson(
      this,
    );
  }
}

abstract class _Audio implements Audio {
  factory _Audio(
      {@JsonKey(name: '_id') required final String id,
      required final String artist,
      required final String title,
      final String? time,
      required final String createdAt,
      required final String description,
      required final String languange,
      required final String isPremium,
      required final List<PathFile> path,
      required final List<PathFile> thumbnail}) = _$AudioImpl;

  factory _Audio.fromJson(Map<String, dynamic> json) = _$AudioImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get artist;
  @override
  String get title;
  @override
  String? get time;
  @override
  String get createdAt;
  @override
  String get description;
  @override
  String get languange;
  @override
  String get isPremium;
  @override
  List<PathFile> get path;
  @override
  List<PathFile> get thumbnail;

  /// Create a copy of Audio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioImplCopyWith<_$AudioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
