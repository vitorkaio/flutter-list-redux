import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:list_redux/store/place/AppState.dart';
import 'package:list_redux/store/place/actions.dart';
// import 'package:list_redux/store/place/actions.dart';

const cor = Colors.purple;

class ListPlaces extends StatefulWidget {
  @override
  _ListPlacesState createState() => _ListPlacesState();
}

class _ListPlacesState extends State<ListPlaces> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Meus Lugares'),
        backgroundColor: cor,
      ),
      body: StoreConnector<AppState, AppState> (
        converter: (store) => store.state,
        builder: (context, state) { 
          return Center(
            child: ListView(
              children: <Widget>[
                ...getItemList(state.places, context)
              ],
            )
          );
        }
      )
    );
  }
}

List<Widget> getItemList(List places, context) {
  if (places.length != 0) {
    return places.map((item) => Card(
      child: ListTile(
        leading: Icon(Icons.place),
        title: Text(item),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () { StoreProvider.of<AppState>(context).dispatch(RemovePlaceAction(item)); },
        )
      ),
    )).toList();
  }
  List<Widget>vazio = [Text('Vazio')];
  return vazio;
}