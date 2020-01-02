import 'dart:async';
import 'package:redux_epics/redux_epics.dart';
import './AppState.dart';
import './actions.dart';

Stream<dynamic> placeEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions
    .where((action) => action is AddPlaceActionRequest)
    .asyncMap((action) async {
      try {
        final place = await testEpic(action.payload);
        return AddPlaceActionSuccess(place);
      } catch (e) {
        print(e);
        return AddPlaceActionError();
      }
    } 
  );
}

/* Stream<dynamic> removePlaceEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return actions
    .where((action) => action is RemovePlaceAction)
    .asyncMap((action) async {
      print('Remove place');
      return RemovePlaceAction(action.payload);
    } 
  );
} */


Future testEpic(place) {
  var completer = Completer();
  Future.delayed(Duration(seconds: 5)).then((old) {
    completer.complete(place);
  })
  .catchError((err) => completer.completeError(err));

  return completer.future;
}
