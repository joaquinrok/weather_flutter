import 'package:flutter/material.dart';
import 'package:weather_flutter/models.dart';

// Styles
final _heroSubtitle = TextStyle(color: Colors.white, fontSize: 17.0);
final _heroTitle =
    TextStyle(color: Colors.white, fontSize: 70.0, fontWeight: FontWeight.w100);
final _heroCaption = TextStyle(color: Colors.white, fontSize: 20.0);


// Helpers
String _formatTemperature(double temperature, {bool displayUnit: true}) {
  return temperature.round().toString() + (displayUnit ? "ºC" : "º");
}

class WeatherHeroCell extends StatelessWidget {
  final DayForecast dayForecast;
  final double topPadding;

  const WeatherHeroCell({this.dayForecast, this.topPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Padding(
        padding: EdgeInsets.only(
          top: topPadding
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 200.0),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Today", style: _heroSubtitle),
                Text(
                  _formatTemperature(dayForecast.avgTemp),
                  style: _heroTitle,
                ),
                Text(
                  "${_formatTemperature(dayForecast.minTemp, displayUnit: false)} - ${_formatTemperature(dayForecast.maxTemp, displayUnit: false)}",
                  style: _heroCaption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherCell extends StatelessWidget {
  final DayForecast dayForecast;

  const WeatherCell({this.dayForecast});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor))),
      child: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            top: 25.0,
            bottom: 25.0,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      dayForecast.dateName(),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      dayForecast.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                  ],
                ),
              ),
              Column(children: <Widget>[
                Text(
                  _formatTemperature(dayForecast.avgTemp),
                  style: Theme.of(context).textTheme.subhead,
                ),
                Text(
                  "${_formatTemperature(dayForecast.minTemp, displayUnit: false)} / ${_formatTemperature(dayForecast.maxTemp, displayUnit: false)}",
                  style: Theme.of(context).textTheme.caption,
                ),
              ])
            ],
          )),
    );
  }
}
