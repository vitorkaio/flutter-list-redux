import 'package:flutter/material.dart';

const cor = Colors.purple;

class AddPlaceForm extends StatefulWidget {

  final Function addPlaceHandler;

  AddPlaceForm(this.addPlaceHandler);

  @override
  _AddPlaceFormState createState() => _AddPlaceFormState();
}

class _AddPlaceFormState extends State<AddPlaceForm> {

  final myController = TextEditingController();

  void submit() {
    widget.addPlaceHandler(myController.text);
    myController.text = '';
    // setState(() {
    //   this._place = '';
    // });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: cor,
        // hintColor: Colors.yellow
      ),
      child: Column(
      children: <Widget>[
        Container(
          width: 300,
          child: TextField(
            controller: myController,
            decoration: InputDecoration(
              hintText: 'Nome do Lugar',
              icon: Icon(Icons.place),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: 120,
          child: RaisedButton(
            color: cor,
            child: Text(
              'Adicionar',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onPressed: submit,
          ),
        )
      ], 
    ),
    );
  }
}