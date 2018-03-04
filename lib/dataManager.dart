import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:weather_flutter/models.dart';

class DataManager {
  static final DataManager _singleton = new DataManager._internal();
  factory DataManager() {
    return _singleton;
  }

  DataManager._internal();

  Future<List<DayForecast>> getWeatherData() async {
    final url =
        'https://api.openweathermap.org/data/2.5/forecast/daily?q=Montevideo,UY&APPID=b0f0d7fd4980c768c7dcab3b18cd6505&units=metric&cnt=16';
    final httpClient = new HttpClient();

    List jsonForecast;
    try {
      final request = await httpClient.getUrl(Uri.parse(url));
      final response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        final String resultText = await response.transform(UTF8.decoder).join();
        var data = JSON.decode(resultText);
        jsonForecast = data['list'];
      } else {
        throw Exception('Error getting IP address:\nHttp status ${response.statusCode}');
      }
    } catch (exception) {
      throw exception;
    }

    List<DayForecast> days = List();

    for (var item in jsonForecast) {
      try {
        days.add(new DayForecast(
          minTemp: item["temp"]["min"].toDouble(),
          maxTemp: item["temp"]["max"].toDouble(),
          avgTemp: item["temp"]["day"].toDouble(),
          epochDate: item["dt"].toInt(),
          title: item["weather"][0]["main"].toString(),
          iconCode: item["weather"][0]["id"].toInt(),
        ));
      } catch (e) {
        print("Error parsing json response of: $item\n $e");
      }
    }
    return days;
  }
}