import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzeria_shared/src/common/user/latlng.dart';

part 'delivery_address.freezed.dart';
part 'delivery_address.g.dart';

@freezed
class DeliveryAddress with _$DeliveryAddress {
  const factory DeliveryAddress(
      {required LatLng location,
      required String street,
      required String city,
      required String building,
      int? entrance,
      int? floor,
      required String? flatNumber}) = _DeliveryAddress;

  const DeliveryAddress._();

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressFromJson(json);
}
