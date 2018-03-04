import 'package:flutter/material.dart';
import 'package:weather_flutter/localization.dart';
import 'package:weather_flutter/screens/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var enDatesFuture = initializeDateFormatting('en', null);
    Future.wait([
      enDatesFuture,
    ]);

    return MaterialApp(
      title: AppLocalizations().appTitle,
      theme: ThemeData.light(),
      localizationsDelegates: [
        AppLocalizationsDelegate(),
      ],
      home: HomeScreen(),
    );
  }
}