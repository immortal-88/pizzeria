import 'package:freezed_annotation/freezed_annotation.dart';

part 'latlng.freezed.dart';
part 'latlng.g.dart';

@freezed
class LatLng with _$LatLng {
  const factory LatLng({required double latitude, required double longitude}) =
      _LatLng;

  const LatLng._();

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
}
