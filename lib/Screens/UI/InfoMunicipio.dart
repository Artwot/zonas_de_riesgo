import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zonas_de_riesgo_app/Screens/Maps/MapsScreen.dart';
import 'package:zonas_de_riesgo_app/model/municipios.dart';

import '../../constants.dart';

class InfoMunicipio extends StatefulWidget {
  final Municipio municipio;
  InfoMunicipio(this.municipio);
  @override
  _InfoMunicipioState createState() => _InfoMunicipioState();
}

final municipioRef = FirebaseDatabase.instance.reference().child('municipio');

class _InfoMunicipioState extends State<InfoMunicipio> {
  List<Municipio> items;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Información'),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: 1,
            padding: EdgeInsets.only(top: 12.0),
            itemBuilder: (context, index) {
              return Container(
                height: 1000.0,
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        //Nombre del municipio:
                        new Text(
                          "${widget.municipio.nombre}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Nombre",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Cabecera municipal:
                        new Text(
                          "${widget.municipio.cabecera_municipal}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Cabecera",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Clave IGECEM:
                        new Text(
                          "${widget.municipio.cve_igecem}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Clave IGECEM",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Significado:
                        new Text(
                          "${widget.municipio.significado}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Significado",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Población
                        new Text(
                          "${widget.municipio.poblacion}" + " habitantes",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Población",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Superficie:
                        new Text(
                          "${widget.municipio.superficie}" + "km²",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Superficie",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        Divider(),
                        //Latitud:
                        new Text(
                          "${widget.municipio.lat}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Latitud",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Longitud:
                        new Text(
                          "${widget.municipio.long}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Longitud",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Altitud:
                        new Text(
                          "${widget.municipio.altitud} m",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Altitud",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Mapa:
                        FlatButton(
                          child: Image.asset('assets/images/mapas_logo.jpg'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapsScreen(
                                          latitud: widget.municipio.lat,
                                          longitud: widget.municipio.long,
                                          nombre: widget.municipio.nombre,
                                        )));
                          },
                        ),
                        new Text(
                          "Localización",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
