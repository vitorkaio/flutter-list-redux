import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:list_redux/store/place/AppState.dart';
import 'package:list_redux/store/store.dart' as providerstore;

import './pages/Home.dart';

final cor = Colors.purple;

void main() {
  runApp(MyApp(store: providerstore.store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Redux and Flutter',
        theme: ThemeData(
          accentColor: cor,
          primaryColor: cor
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
        },
      ),
    );
  }
}