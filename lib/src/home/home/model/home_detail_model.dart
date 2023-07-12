import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class HomeDetailModel {
  ///
  @JsonProperty(name: 'code')
  int? code;

  ///
  @JsonProperty(name: 'msg')
  String? msg;
}
