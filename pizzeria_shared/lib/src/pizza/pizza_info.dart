import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzeria_shared/src/common/converter/object_id_converter.dart';
import 'package:pizzeria_shared/src/pizza/ingredient.dart';

part 'pizza_info.freezed.dart';
part 'pizza_info.g.dart';

@freezed
class PizzaInfo with _$PizzaInfo {
  const factory PizzaInfo({
    @ObjectIdConverter() @JsonKey(name: '_id') required dynamic id,
    required String name,
    required String description,
    required double price,
    required String imageUrl,
    required bool isAvailable,
    required List<Ingredient> ingredients,
    double? rating,
    required int weight,
  }) = _PizzaInfo;

  const PizzaInfo._();

  factory PizzaInfo.fromJson(Map<String, dynamic> json) =>
      _$PizzaInfoFromJson(json);
}
