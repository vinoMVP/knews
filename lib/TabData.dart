import 'package:json_annotation/json_annotation.dart';

part 'TabData.g.dart';

@JsonSerializable()
class TabData {
  String code;
  List<TabContent> data;

  TabData(this.code, this.data);

  factory TabData.fromJson(Map<String, dynamic> json) =>
      _$TabDataFromJson(json);

  Map<String, dynamic> toJson() => _$TabDataToJson(this);
}

@JsonSerializable()
class TabContent {
  String name;
  String url;

  TabContent(this.name, this.url);

  TabContent.fromJson(Map<String, dynamic> map)
      : name = map["name"],
        url = map["url"];
}
