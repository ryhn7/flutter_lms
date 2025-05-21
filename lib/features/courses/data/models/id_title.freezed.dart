// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'id_title.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IdTitle _$IdTitleFromJson(Map<String, dynamic> json) {
  return _IdTitle.fromJson(json);
}

/// @nodoc
mixin _$IdTitle {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this IdTitle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IdTitle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IdTitleCopyWith<IdTitle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdTitleCopyWith<$Res> {
  factory $IdTitleCopyWith(IdTitle value, $Res Function(IdTitle) then) =
      _$IdTitleCopyWithImpl<$Res, IdTitle>;
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String title});
}

/// @nodoc
class _$IdTitleCopyWithImpl<$Res, $Val extends IdTitle>
    implements $IdTitleCopyWith<$Res> {
  _$IdTitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IdTitle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdTitleImplCopyWith<$Res> implements $IdTitleCopyWith<$Res> {
  factory _$$IdTitleImplCopyWith(
          _$IdTitleImpl value, $Res Function(_$IdTitleImpl) then) =
      __$$IdTitleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '_id') String id, String title});
}

/// @nodoc
class __$$IdTitleImplCopyWithImpl<$Res>
    extends _$IdTitleCopyWithImpl<$Res, _$IdTitleImpl>
    implements _$$IdTitleImplCopyWith<$Res> {
  __$$IdTitleImplCopyWithImpl(
      _$IdTitleImpl _value, $Res Function(_$IdTitleImpl) _then)
      : super(_value, _then);

  /// Create a copy of IdTitle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$IdTitleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdTitleImpl implements _IdTitle {
  _$IdTitleImpl({@JsonKey(name: '_id') required this.id, required this.title});

  factory _$IdTitleImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdTitleImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'IdTitle(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdTitleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of IdTitle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdTitleImplCopyWith<_$IdTitleImpl> get copyWith =>
      __$$IdTitleImplCopyWithImpl<_$IdTitleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdTitleImplToJson(
      this,
    );
  }
}

abstract class _IdTitle implements IdTitle {
  factory _IdTitle(
      {@JsonKey(name: '_id') required final String id,
      required final String title}) = _$IdTitleImpl;

  factory _IdTitle.fromJson(Map<String, dynamic> json) = _$IdTitleImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get title;

  /// Create a copy of IdTitle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdTitleImplCopyWith<_$IdTitleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
