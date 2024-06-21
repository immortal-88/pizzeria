import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

part 'token_info_response.freezed.dart';
part 'token_info_response.g.dart';

@freezed
@HiveType(typeId: 0)
class TokenInfoResponse with _$TokenInfoResponse {
  const factory TokenInfoResponse({
    @HiveField(0) required String userId,
    @HiveField(1) String? deviceId,
    @HiveField(2) String? firstName,
    @HiveField(3) String? lastName,
    @HiveField(4) String? photoUrl,
  }) = _TokenInfoResponse;

  factory TokenInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoResponseFromJson(json);
}
