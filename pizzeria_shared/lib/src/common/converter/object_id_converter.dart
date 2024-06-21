import 'package:bson/bson.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ObjectIdConverter implements JsonConverter<String, ObjectId> {
  const ObjectIdConverter();

  @override
  String fromJson(ObjectId objectId) => objectId.toHexString();

  @override
  ObjectId toJson(String json) => ObjectId.parse(json);
}
