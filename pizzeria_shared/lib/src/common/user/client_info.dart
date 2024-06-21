import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzeria_shared/pizzeria_shared.dart';

part 'client_info.freezed.dart';
part 'client_info.g.dart';

@freezed
class ClientInfo with _$ClientInfo {
  const factory ClientInfo(
      {@ObjectIdConverter() @JsonKey(name: '_id') required dynamic id,
      String? firstName,
      String? lastName,
      String? email,
      String? phoneNumber,
      DeliveryAddress? deliveryAddress,
      String? photoUrl}) = _ClientInfo;

  const ClientInfo._();

  factory ClientInfo.fromJson(Map<String, dynamic> json) =>
      _$ClientInfoFromJson(json);
}
