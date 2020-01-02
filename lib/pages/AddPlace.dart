import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:list_redux/components/form/AddPlaceForm.dart';
import 'package:list_redux/store/place/AppState.dart';
import 'package:list_redux/store/place/actions.dart';

const cor = Colors.purple;

final String assetName = 'images/place_img.svg';
final Widget svgIcon = SvgPicture.asset(
  assetName,
  semanticsLabel: 'A red up arrow',
  width: 180,
  height: 180,
);

class AddPlace extends StatefulWidget {
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {

  void addPlaceHandler(value) {
    StoreProvider.of<AppState>(context).dispatch(AddPlaceAction(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Lugares'),
        backgroundColor: cor,
      ),
      body: StoreConnector<AppState, AppState> (
        converter: (store) => store.state,
        builder: (context, state) { 
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[80],
            child: Column(
              children: <Widget>[
                Expanded(
                  child: svgIcon,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: AddPlaceForm(this.addPlaceHandler),
                  )
                )
              ],
            )
          );
        }
      ),
    );
  }
}