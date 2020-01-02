
/// Actions with Payload
class AddPlaceActionRequest {
  final String payload;
  AddPlaceActionRequest(this.payload);
}

class AddPlaceActionSuccess {
  final String payload;
  AddPlaceActionSuccess(this.payload);
}

class AddPlaceActionError {
  AddPlaceActionError();
}

class RemovePlaceAction {
  final String payload;
  RemovePlaceAction(this.payload);
}
