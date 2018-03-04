// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

DayForecast _$DayForecastFromJson(Map<String, dynamic> json) => new DayForecast(
    minTemp: (json['minTemp'] as num)?.toDouble(),
    maxTemp: (json['maxTemp'] as num)?.toDouble(),
    avgTemp: (json['avgTemp'] as num)?.toDouble(),
    epochDate: json['dt'] as int,
    title: json['title'] as String,
    iconCode: json['iconCode'] as int);

abstract class _$DayForecastSerializerMixin {
  double get minTemp;
  double get maxTemp;
  double get avgTemp;
  int get epochDate;
  String get title;
  int get iconCode;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'minTemp': minTemp,
        'maxTemp': maxTemp,
        'avgTemp': avgTemp,
        'dt': epochDate,
        'title': title,
        'iconCode': iconCode
      };
}
