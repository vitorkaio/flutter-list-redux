import 'package:flutter/material.dart';

class AppState {
  List places;

  AppState({@required this.places});

  AppState.fromAppState(AppState another) {
    places = another.places;
  }

  List getPlaces() => places;
}