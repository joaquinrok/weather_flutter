import 'package:flutter/material.dart';
import 'package:weather_flutter/models.dart';
import 'package:weather_flutter/widgets/forecast_cells.dart';
import 'package:weather_flutter/dataManager.dart';
import 'package:async_loader/async_loader.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _topPadding = 0.0; // will be set on build when appBar is created

  initState() {
    super.initState();
  }

  ListView _buildForecastList(List<DayForecast> data) {
    var _listView = ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          DayForecast d = data[index];
          if (index == 0) {
            return new WeatherHeroCell(
              dayForecast: d,
              topPadding: _topPadding,
            );
          } else {
            return new WeatherCell(
              dayForecast: d,
            );
          }
        });
    return _listView;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<AsyncLoaderState> _forecastAsyncLoaderState =
        new GlobalKey<AsyncLoaderState>();

    var _forecastAsyncLoader = AsyncLoader(
      key: _forecastAsyncLoaderState,
      initState: () async => await DataManager().getWeatherData(),
      renderLoad: () => Center(child: CircularProgressIndicator()),
      renderError: ([error]) =>
          Center(child: Text('Sorry, there was an error loading the data')),
      renderSuccess: ({data}) => _buildForecastList(data),
    );

    final _appBar = AppBar(
      title: Text(
          "Montevideo, Uruguay"),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.refresh),
          onPressed: () => _forecastAsyncLoaderState.currentState.reloadState(),
        )
      ],
    );
    _topPadding =
        MediaQuery.of(context).padding.top + _appBar.preferredSize.height;

    return Scaffold(
      bodyBehindAppBar: true,
      appBar: _appBar,
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment
                      .bottomCenter, // 10% of the width, so there are ten blinds.
                  colors: [const Color(0xff3a9bf3), const Color(0xff60ffdc)])),
          child: _forecastAsyncLoader,
        ),
      ),
    );
  }
}
