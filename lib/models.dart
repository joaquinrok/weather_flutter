import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'package:weather_flutter/models.g.dart';

@JsonSerializable()
class DayForecast extends Object with _$DayForecastSerializerMixin {

  factory DayForecast.fromJson(Map<String, dynamic> json) => _$DayForecastFromJson(json);

  final double minTemp;
  final double maxTemp;
  final double avgTemp;
  @JsonKey(name: 'dt')
  final int epochDate;
  final String title;
  final int iconCode;

  DayForecast({
    this.minTemp,
    this.maxTemp,
    this.avgTemp,
    this.epochDate,
    this.title,
    this.iconCode,
  });

  String _ordenal(DateTime date) {
    var dateStr = date.toString();
    switch (int.parse(dateStr.substring(dateStr.length-2,dateStr.length-1))) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }

  String dateName() {
    var date = DateTime.fromMillisecondsSinceEpoch(epochDate*1000, isUtc: true);
    return DateFormat('EEEE d').format(date)+_ordenal(date);
  }
}