import 'package:flutter/material.dart';

import './AddPlace.dart';
import './ListPlaces.dart';

const cor = Colors.purple;

class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    ListPlaces(),
    AddPlace(),
  ];

  void _onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: cor,
        onTap: _onTabTapped, // new
        currentIndex: _currentIndex, // new // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.place),
            title: new Text('Lugares'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.edit),
            title: new Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
 final Color color;

 PlaceholderWidget(this.color);

 @override
 Widget build(BuildContext context) {
   return Container(
     color: color,
   );
 }
}