// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TabData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TabData _$TabDataFromJson(Map<String, dynamic> json) {
  return TabData(
      json['code'] as String,
      (json['data'] as List)
          ?.map(
              (e) => e == null ? null : TabContent.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TabDataToJson(TabData instance) =>
    <String, dynamic>{'code': instance.code, 'data': instance.data};

TabContent _$TabFromJson(Map<String, dynamic> json) {
  return TabContent(json['name'] as String, json['url'] as String);
}

Map<String, dynamic> _$TabToJson(TabContent instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
