import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App 3C'),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Inicio'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Mapa Estático'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Mapa Interactivo'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Realidad virtual+unity'),
            onTap: () {},
          )
        ],
      )),
    );
  }
}
