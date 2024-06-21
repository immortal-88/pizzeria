import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzeria_shared/src/common/converter/object_id_converter.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    @ObjectIdConverter() @JsonKey(name: '_id') required dynamic id,
    required String name,
    required String imageUrl,
    required double price,
  }) = _Ingredient;

  const Ingredient._();

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
