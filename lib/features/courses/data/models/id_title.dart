import 'package:freezed_annotation/freezed_annotation.dart';

part 'id_title.freezed.dart';
part 'id_title.g.dart';

@freezed
class IdTitle with _$IdTitle {
  factory IdTitle({
    @JsonKey(name: '_id') required String id,
    required String title,
  }) = _IdTitle;

  factory IdTitle.fromJson(Map<String, dynamic> json) => _$IdTitleFromJson(json);
}
