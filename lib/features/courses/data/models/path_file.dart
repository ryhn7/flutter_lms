import 'package:freezed_annotation/freezed_annotation.dart';

part 'path_file.freezed.dart';
part 'path_file.g.dart';

@freezed
class PathFile with _$PathFile {
  factory PathFile({
    required String fileName,
    required String url,
  }) = _PathFile;

  factory PathFile.fromJson(Map<String, dynamic> json) => _$PathFileFromJson(json);
}
