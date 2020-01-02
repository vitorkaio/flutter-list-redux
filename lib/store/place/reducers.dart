import 'package:list_redux/store/place/AppState.dart';
import 'package:list_redux/store/place/actions.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  /* switch (action) {
    case AddPlaceAction:
      newState = newState.places.add(action.payload);  
    break;
    default:
  } */

  if (action is AddPlaceActionRequest) {
    newState.loadingPlaces = true;
    newState.errorPlaces = false;
  } 

  else if (action is AddPlaceActionSuccess) {
    newState.places.add(action.payload);
    newState.loadingPlaces = false;
    newState.errorPlaces = false;
  }

  else if (action is AddPlaceActionError) {
    newState.loadingPlaces = false;
    newState.errorPlaces = true;
  }
  
  else if (action is RemovePlaceAction) {
    newState.places.remove(action.payload);
  }
  /* else if (action is Bold) {
    newState.bold = action.payload;
  } else if (action is Italic) {
    newState.italic = action.payload;
  } */
  return newState;
}