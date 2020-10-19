import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
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
                height: 1650.0,
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
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        new Text(
                          "PRINCIPALES ASPECTOS",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: kBlueColor),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Canales
                        new Text(
                          "${widget.municipio.canales_rios}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Canales o Ríos",
                          style: TextStyle(
                              color: kBlueColor, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Capacidad
                        new Text(
                          "${widget.municipio.capacidad}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Capacidad",
                          style: TextStyle(
                              color: kBlueColor, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Longitud
                        new Text(
                          "${widget.municipio.longitud}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Longitud",
                          style: TextStyle(
                              color: kBlueColor, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Longitud
                        new Text(
                          "${widget.municipio.cuerpos_agua}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Cuerpos de agua",
                          style: TextStyle(
                              color: kBlueColor, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Volcán:
                        new Text(
                          "${widget.municipio.volcan}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Volcán",
                          style: TextStyle(
                              color: kBlueColor, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Altitud del Volcán:
                        new Text(
                          "${widget.municipio.altitud_volcan}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Altitud del volcán (m)",
                          style: TextStyle(
                              color: kBlueColor, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //CLIMA:
                        new Text(
                          "CLIMA",
                          style: TextStyle(
                              color: kGreenColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Cálido:
                        new Text(
                          "${widget.municipio.calido}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Cálido",
                          style: TextStyle(
                              color: kGreenColor, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Seco:
                        new Text(
                          "${widget.municipio.seco}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Seco",
                          style: TextStyle(
                              color: kGreenColor, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Semi árido:
                        new Text(
                          "${widget.municipio.semiarido}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Semiárido",
                          style: TextStyle(
                              color: kGreenColor, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Templado:
                        new Text(
                          "${widget.municipio.templado}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Templado",
                          style: TextStyle(
                              color: kGreenColor, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Semifrío:
                        new Text(
                          "${widget.municipio.semifrio}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Semi frío",
                          style: TextStyle(
                              color: kGreenColor, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
                        //Frío:
                        new Text(
                          "${widget.municipio.frio}",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                        new Text(
                          "Frío",
                          style: TextStyle(
                              color: kGreenColor, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.0)),
                        Divider(),
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

String informacion(String municipio, String poblacion, String superficie) {
  String adicional = "";
  municipio = municipio.toLowerCase();
  switch (municipio) {
    case "naucalpan":
      {
        adicional = "Es uno de los municipios mas industializados \n "
                "Tambien es uno de los mas poblados con " +
            poblacion +
            " de habitantes";
      }
      break;
    case "naucalpan de juarez":
      {
        adicional = "Es uno de los municipios mas industializados \n "
                "Tambien es uno de los mas poblados con " +
            poblacion +
            " de habitantes";
      }
      break;
    case "ecatepec de morelos":
      {
        adicional = "Es uno de los municipios mas industializados \n "
                "Tambien es uno de los mas poblados con " +
            poblacion +
            " de habitantes";
      }
      break;
    case "tlalnepantla":
      {
        adicional = "Es uno de los municipios mas industializados \n "
                "Tambien es uno de los mas poblados con " +
            poblacion +
            " de habitantes";
      }
      break;
    case "ecatepec":
      {
        adicional = "Es uno de los municipios mas industializados \n "
                "Tambien es uno de los mas poblados con " +
            poblacion +
            " de habitantes";
      }
      break;
    case "toluca":
      {
        adicional =
            "Es uno de los mas poblados con " + poblacion + " de habitantes";
      }
      break;
    case "toluca":
      {
        adicional =
            "Es uno de los mas poblados con " + poblacion + " de habitantes";
      }
      break;
    case "netzahualcoyotl":
      {
        adicional =
            "Es uno de los mas poblados con " + poblacion + " de habitantes";
      }
      break;
    case "tlatlaya":
      {
        adicional = "Es uno de los mas extensos con " + superficie + " km2";
      }
      break;

    case "luvianos":
      {
        adicional = "Es uno de los mas extensos con " + superficie + " km2";
      }
      break;
    case "tejupilco":
      {
        adicional = "Es uno de los mas extensos con " + superficie + " km2";
      }
      break;
  }
  return adicional;
}

Color colort(String municipio) {
  Color adicional = kPrimaryColor;
  municipio = municipio.toLowerCase();
  switch (municipio) {
    case "naucalpan":
      {
        adicional = Colors.blue;
      }
      break;
    case "naucalpan de juarez":
      {
        adicional = Colors.blue;
      }
      break;
    case "ecatepec de morelos":
      {
        adicional = Colors.blue;
      }
      break;
    case "ecatepec":
      {
        adicional = Colors.blue;
      }
      break;
    case "tlalnepantla":
      {
        adicional = Colors.blue;
      }
      break;

    case "toluca":
      {
        adicional = Colors.lime;
      }
      break;

      break;
    case "netzahualcoyotl":
      {
        adicional = Colors.lime;
      }
      break;
    case "tlatlaya":
      {
        adicional = Colors.pinkAccent;
      }
      break;

    case "luvianos":
      {
        adicional = Colors.pinkAccent;
      }
      break;
    case "tejupilco":
      {
        adicional = Colors.pinkAccent;
      }
      break;
  }
  return adicional;
}
