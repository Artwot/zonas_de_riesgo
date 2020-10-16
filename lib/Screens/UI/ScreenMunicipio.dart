import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zonas_de_riesgo_app/components/text_field.dart';
import 'package:zonas_de_riesgo_app/model/municipios.dart';

import '../../constants.dart';

class ScreenMunicipio extends StatefulWidget {
  final Municipio municipio;
  ScreenMunicipio(this.municipio);

  @override
  _ScreenMunicipioState createState() => _ScreenMunicipioState();
}

final municipioRef = FirebaseDatabase.instance.reference().child('municipio');

class _ScreenMunicipioState extends State<ScreenMunicipio> {
  List<Municipio> items;

  TextEditingController idController;
  TextEditingController nombreController;
  TextEditingController cve_igecemController;
  TextEditingController cabecera_municipalController;
  TextEditingController altitudController;
  TextEditingController significadoController;
  TextEditingController poblacionController;
  TextEditingController volcanController;
  TextEditingController altitud_volcanController;
  TextEditingController canales_riosController;
  TextEditingController longitudController;
  TextEditingController cuerpos_aguaController;
  TextEditingController capacidadController;
  TextEditingController calidoController;
  TextEditingController semiaridoController;
  TextEditingController secoController;
  TextEditingController templadoController;
  TextEditingController semifrioController;
  TextEditingController frioController;
  TextEditingController latController;
  TextEditingController longController;
  TextEditingController superficieController;

  @override
  void initState() {
    super.initState();
    nombreController = new TextEditingController(text: widget.municipio.nombre);
    cve_igecemController =
        new TextEditingController(text: widget.municipio.cve_igecem);
    cabecera_municipalController =
        new TextEditingController(text: widget.municipio.cabecera_municipal);
    altitudController =
        new TextEditingController(text: widget.municipio.altitud);
    significadoController =
        new TextEditingController(text: widget.municipio.significado);
    poblacionController =
        new TextEditingController(text: widget.municipio.poblacion);
    volcanController = new TextEditingController(text: widget.municipio.volcan);
    altitud_volcanController =
        new TextEditingController(text: widget.municipio.altitud_volcan);
    canales_riosController =
        new TextEditingController(text: widget.municipio.canales_rios);
    longitudController =
        new TextEditingController(text: widget.municipio.longitud);
    cuerpos_aguaController =
        new TextEditingController(text: widget.municipio.cuerpos_agua);
    capacidadController =
        new TextEditingController(text: widget.municipio.capacidad);
    calidoController = new TextEditingController(text: widget.municipio.calido);
    semiaridoController =
        new TextEditingController(text: widget.municipio.semiarido);
    secoController = new TextEditingController(text: widget.municipio.seco);
    templadoController =
        new TextEditingController(text: widget.municipio.templado);
    semifrioController =
        new TextEditingController(text: widget.municipio.semifrio);
    frioController = new TextEditingController(text: widget.municipio.frio);
    latController = new TextEditingController(text: widget.municipio.lat);
    longController = new TextEditingController(text: widget.municipio.long);
    superficieController =
        new TextEditingController(text: widget.municipio.superficie);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text("Añadir Municipio"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 1,
          padding: EdgeInsets.only(top: 12.0),
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                //Nombre del municipio:
                TextFieldContainer(
                  child: TextField(
                    controller: nombreController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.location_city,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Nombre del municipio',
                      hintText: 'Nombre del municipio',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Clave IGECEM:
                TextFieldContainer(
                  child: TextField(
                    controller: cve_igecemController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.confirmation_num,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Clave IGECEM',
                      hintText: 'Clave IGECEM',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Cabecera Municipal:
                TextFieldContainer(
                  child: TextField(
                    controller: cabecera_municipalController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.location_city,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Cabecera Municipal',
                      hintText: 'Cabecera Municipal',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Significado:
                TextFieldContainer(
                  child: TextField(
                    controller: significadoController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.format_quote,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Significado',
                      hintText: 'Significado',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Población:
                TextFieldContainer(
                  child: TextField(
                    controller: poblacionController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.people,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Población',
                      hintText: 'Población',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Superficie:
                TextFieldContainer(
                  child: TextField(
                    controller: superficieController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.location_city,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Superficie',
                      hintText: 'Superficie',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Latitud:
                TextFieldContainer(
                  child: TextField(
                    controller: latController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.location_on,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Latitud',
                      hintText: 'Latitud',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Longitud:
                TextFieldContainer(
                  child: TextField(
                    controller: longController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.location_on,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Longitud',
                      hintText: 'Longitud',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Altitud:
                TextFieldContainer(
                  child: TextField(
                    controller: altitudController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.nature_people,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Altitud',
                      hintText: 'Altitud',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Volcán:
                TextFieldContainer(
                  child: TextField(
                    controller: volcanController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: FaIcon(
                        FontAwesomeIcons.mountain,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Volcán',
                      hintText: 'Volcán',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Altitud del volcán:
                TextFieldContainer(
                  child: TextField(
                    controller: altitud_volcanController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: FaIcon(
                        FontAwesomeIcons.mountain,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Altitud del volcán',
                      hintText: 'Altitud del volcán',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Canales y rios:
                TextFieldContainer(
                  child: TextField(
                    controller: canales_riosController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: FaIcon(
                        FontAwesomeIcons.water,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Canales y rios',
                      hintText: 'Canales y rios',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Longitud:
                TextFieldContainer(
                  child: TextField(
                    controller: longitudController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.waterfall_chart,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Longitud',
                      hintText: 'Longitud',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Cuerpos de agua:
                TextFieldContainer(
                  child: TextField(
                    controller: cuerpos_aguaController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.water_damage,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Cuerpos de agua',
                      hintText: 'Cuerpos de agua',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Capacidad:
                TextFieldContainer(
                  child: TextField(
                    controller: capacidadController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.water_damage,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Capacidad',
                      hintText: 'Capacidad',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Cálido:
                TextFieldContainer(
                  child: TextField(
                    controller: calidoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: FaIcon(
                        FontAwesomeIcons.thermometerFull,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Cálido',
                      hintText: 'Cálido',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Semiarido:
                TextFieldContainer(
                  child: TextField(
                    controller: semiaridoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.hot_tub,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Semiarido',
                      hintText: 'Semiarido',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Seco:
                TextFieldContainer(
                  child: TextField(
                    controller: secoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.hot_tub,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Seco',
                      hintText: 'Seco',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Templado:
                TextFieldContainer(
                  child: TextField(
                    controller: templadoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: FaIcon(
                        FontAwesomeIcons.thermometerHalf,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Templado',
                      hintText: 'Templado',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Semifrio:
                TextFieldContainer(
                  child: TextField(
                    controller: semifrioController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: FaIcon(
                        FontAwesomeIcons.thermometerEmpty,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Semifrio',
                      hintText: 'Semifrio',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                //Frío:
                TextFieldContainer(
                  child: TextField(
                    controller: semifrioController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: FaIcon(
                        FontAwesomeIcons.thermometerEmpty,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Frío',
                      hintText: 'Frío',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: kPrimaryColor,
                      onPressed: () {
                        if (widget.municipio.id != null) {
                          municipioRef.child(widget.municipio.id).set({
                            'nombre': nombreController.text,
                            'cve_igecem': cve_igecemController.text,
                            'cabecera_municipal':
                                cabecera_municipalController.text,
                            'altitud': altitudController.text,
                            'significado': significadoController.text,
                            'poblacion': poblacionController.text,
                            'volcan': volcanController.text,
                            'altitud_volcan': altitud_volcanController.text,
                            'canales_rios': canales_riosController.text,
                            'longitud': longitudController.text,
                            'cuerpos_agua': cuerpos_aguaController.text,
                            'capacidad': capacidadController.text,
                            'calido': calidoController.text,
                            'semiarido': semiaridoController.text,
                            'seco': secoController.text,
                            'templado': templadoController.text,
                            'semifrio': semifrioController.text,
                            'frio': frioController.text,
                            'lat': latController.text,
                            'long': longController.text,
                            'superficie': superficieController.text
                          }).then((_) => {Navigator.pop(context)});
                        } else {
                          municipioRef.push().set({
                            'nombre': nombreController.text,
                            'cve_igecem': cve_igecemController.text,
                            'cabecera_municipal':
                                cabecera_municipalController.text,
                            'altitud': altitudController.text,
                            'significado': significadoController.text,
                            'poblacion': poblacionController.text,
                            'volcan': volcanController.text,
                            'altitud_volcan': altitud_volcanController.text,
                            'canales_rios': canales_riosController.text,
                            'longitud': longitudController.text,
                            'cuerpos_agua': cuerpos_aguaController.text,
                            'capacidad': capacidadController.text,
                            'calido': calidoController.text,
                            'semiarido': semiaridoController.text,
                            'seco': secoController.text,
                            'templado': templadoController.text,
                            'semifrio': semifrioController.text,
                            'frio': frioController.text,
                            'lat': latController.text,
                            'long': longController.text,
                            'superficie': superficieController.text
                          }).then((_) => {Navigator.pop(context)});
                        }
                      },
                      child: (widget.municipio.id != null)
                          ? Text(
                              'Actualizar',
                              style: TextStyle(color: kLightColor),
                            )
                          : Text(
                              'Agregar',
                              style: TextStyle(color: kLightColor),
                            ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
