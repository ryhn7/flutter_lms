// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PathFile _$PathFileFromJson(Map<String, dynamic> json) {
  return _PathFile.fromJson(json);
}

/// @nodoc
mixin _$PathFile {
  String get fileName => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PathFile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PathFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PathFileCopyWith<PathFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PathFileCopyWith<$Res> {
  factory $PathFileCopyWith(PathFile value, $Res Function(PathFile) then) =
      _$PathFileCopyWithImpl<$Res, PathFile>;
  @useResult
  $Res call({String fileName, String url});
}

/// @nodoc
class _$PathFileCopyWithImpl<$Res, $Val extends PathFile>
    implements $PathFileCopyWith<$Res> {
  _$PathFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PathFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PathFileImplCopyWith<$Res>
    implements $PathFileCopyWith<$Res> {
  factory _$$PathFileImplCopyWith(
          _$PathFileImpl value, $Res Function(_$PathFileImpl) then) =
      __$$PathFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fileName, String url});
}

/// @nodoc
class __$$PathFileImplCopyWithImpl<$Res>
    extends _$PathFileCopyWithImpl<$Res, _$PathFileImpl>
    implements _$$PathFileImplCopyWith<$Res> {
  __$$PathFileImplCopyWithImpl(
      _$PathFileImpl _value, $Res Function(_$PathFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of PathFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? url = null,
  }) {
    return _then(_$PathFileImpl(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PathFileImpl implements _PathFile {
  _$PathFileImpl({required this.fileName, required this.url});

  factory _$PathFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$PathFileImplFromJson(json);

  @override
  final String fileName;
  @override
  final String url;

  @override
  String toString() {
    return 'PathFile(fileName: $fileName, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PathFileImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileName, url);

  /// Create a copy of PathFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PathFileImplCopyWith<_$PathFileImpl> get copyWith =>
      __$$PathFileImplCopyWithImpl<_$PathFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PathFileImplToJson(
      this,
    );
  }
}

abstract class _PathFile implements PathFile {
  factory _PathFile(
      {required final String fileName,
      required final String url}) = _$PathFileImpl;

  factory _PathFile.fromJson(Map<String, dynamic> json) =
      _$PathFileImpl.fromJson;

  @override
  String get fileName;
  @override
  String get url;

  /// Create a copy of PathFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PathFileImplCopyWith<_$PathFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
