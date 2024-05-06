import 'package:freezed_annotation/freezed_annotation.dart';

part 'idol.freezed.dart';

part 'idol.g.dart';

@freezed
class Idol with _$Idol {
  const factory Idol({
    required int id,
    required final String imageUrl,
    required final String title,
    required final String subTitle,
    required final String description,
  }) = _Idol;

  factory Idol.fromJson(Map<String, Object?> json) => _$IdolFromJson(json);
}
