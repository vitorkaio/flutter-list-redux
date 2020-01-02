import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:list_redux/store/place/AppState.dart';
import 'package:list_redux/store/place/reducers.dart';
import 'package:list_redux/store/place/epics.dart';

final _initialState = AppState();
final List<Function> _epics = [
  EpicMiddleware(placeEpic), 
  /* EpicMiddleware(removePlaceEpic) */
];

final Store<AppState> store = Store<AppState>(reducer, initialState: _initialState, 
middleware: [..._epics]);