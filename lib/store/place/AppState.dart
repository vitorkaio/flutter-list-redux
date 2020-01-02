import 'package:flutter/material.dart';

class AppState {
  List places = [];
  bool loadingPlaces;
  bool errorPlaces;

  AppState({this.loadingPlaces = false, this.errorPlaces = false});

  AppState.fromAppState(AppState another) {
    places = another.places;
    loadingPlaces = another.loadingPlaces;
    errorPlaces = another.errorPlaces;
  }

  List getPlaces() => places;
  bool getLoadingPlaces() => loadingPlaces;
}