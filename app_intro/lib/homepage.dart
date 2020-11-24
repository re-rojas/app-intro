import 'package:flutter/material.dart';
import 'inicio.dart';
import 'tab1.dart';
import 'tab2.dart';
import 'tab3.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _valorTabAbierta = 0; //valor numerico pestaña abierta

  _obtenerTabAbierta(int valor) {
    //funcion para obtener que pestaña está abierta
    switch (valor) {
      case 0:
        return Inicio();
      case 1:
        return Tab1();
      case 2:
        return Tab2();
      case 3:
        return Tab3();
    }
  }

  _cambiarTabAbierta(int valor) {
    //funcion para cambiar el valor numerico de la pestaña abierta
    Navigator.of(context)
        .pop(); //para que al presionar una pestaña, se cierre el menu
    setState(() {
      //nuevo estado para que pueda cambiar de pestaña
      _valorTabAbierta = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App 3C'),
      ),
      drawer: Drawer(
          //menu lateral
          child: ListView(
        children: <Widget>[
          DrawerHeader(
            //parte superior menu lateral, la que tiene el título
            decoration: BoxDecoration(
              color: Colors.blue[900],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  "Conoce Casa Central",
                  textScaleFactor: 2.0,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          ListTile(
            //lista de botones hacia abajo, con la funcionalidad para cambiar la pestaña
            title: Text('Inicio'),
            onTap: () {
              _cambiarTabAbierta(0);
            },
          ),
          ListTile(
            title: Text('Mapa Estático'),
            onTap: () {
              _cambiarTabAbierta(1);
            },
          ),
          ListTile(
            title: Text('Mapa Interactivo'),
            onTap: () {
              _cambiarTabAbierta(2);
            },
          ),
          ListTile(
            title: Text('Realidad virtual+unity'),
            onTap: () {
              _cambiarTabAbierta(3);
            },
          )
        ],
      )),
      body: _obtenerTabAbierta(_valorTabAbierta),
    );
  }
}
